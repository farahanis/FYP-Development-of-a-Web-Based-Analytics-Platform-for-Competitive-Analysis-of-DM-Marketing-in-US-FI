import pandas as pd
import plotly.graph_objects as go
import streamlit as st
import os
import calendar
import base64

#######################################
# PAGE SETUP
#######################################
st.set_page_config(
    page_title="Direct Mail Insights Dashboard",
    page_icon="📊",
    layout="wide",
    initial_sidebar_state="expanded"
)

#######################################
# SESSION STATE INIT
#######################################
if "authenticated" not in st.session_state:
    st.session_state["authenticated"] = False

#######################################
# DATA PATH
#######################################
DATA_PATH = "Data/Cleaned_DM US Financial Institutions Dataset.xlsx"
if not os.path.exists(DATA_PATH):
    st.error(f"Data file not found at {DATA_PATH}")
    st.stop()

#######################################
# LOAD DATA
#######################################
@st.cache_data
def load_data(path):
    df = pd.read_excel(path)
    if "month" in df.columns:
        df["month"] = pd.to_datetime(df["month"], errors='coerce')
        df['month_name'] = df['month'].dt.month_name()
    return df

df = load_data(DATA_PATH)

#######################################
# BASE64 IMAGE LOADER
#######################################
def get_base64_image(image_file):
    with open(image_file, "rb") as img:
        return base64.b64encode(img.read()).decode()

#######################################
# LOGIN PAGE
#######################################
def login_page():
    img_base64 = get_base64_image("Media/login.jpg")

    page_bg_img = f"""
    <style>
    .stApp {{
        background: url("data:image/jpg;base64,{img_base64}") no-repeat center center fixed;
        background-size: cover;
    }}
    [data-testid="stSidebar"] {{
        background-color: rgba(0,0,0,0.6) !important;
    }}
    .login-card {{
        background: rgba(0, 0, 0, 0.65);
        padding: 40px;
        border-radius: 15px;
        box-shadow: 0px 8px 24px rgba(0,0,0,0.6);
        color: white;
        max-width: 400px;
        margin: 120px auto;
        text-align: center;
    }}
    .login-card h1 {{
        color: #66FCF1;
        margin-bottom: 10px;
    }}
    .login-card p {{
        color: #ddd;
        margin-bottom: 20px;
    }}
    </style>
    """
    st.markdown(page_bg_img, unsafe_allow_html=True)

    st.markdown('<div class="login-card">', unsafe_allow_html=True)
    st.markdown("<h1>🔐 Secure Login</h1>", unsafe_allow_html=True)
    st.markdown("<p>Smart Insights for Smarter Decisions</p>", unsafe_allow_html=True)

    username = st.text_input("👤 Username")
    password = st.text_input("🔑 Password", type="password")

    if st.button("Sign In"):
        if username == "admin" and password == "0987":
            st.session_state["authenticated"] = True
        else:
            st.error("❌ Invalid username or password")

    st.markdown('</div>', unsafe_allow_html=True)

#######################################
# SIDEBAR ACTIONS: LOGOUT + EXPORT CSV CENTERED
#######################################
def sidebar_actions(filtered_df):
    st.sidebar.write("---")
    # Centered container
    st.sidebar.markdown(
        """
        <div style="text-align:center; margin-top:10px; margin-bottom:10px;">
        """, unsafe_allow_html=True
    )

    if st.sidebar.button("🚪 Logout"):
        st.session_state["authenticated"] = False

    if not filtered_df.empty:
        csv_data = filtered_df.to_csv(index=False).encode('utf-8')
        st.sidebar.download_button(
            label="⬇️ Export CSV",
            data=csv_data,
            file_name="filtered_data.csv",
            mime="text/csv"
        )

    st.sidebar.markdown("</div>", unsafe_allow_html=True)

#######################################
# DASHBOARD
#######################################
def dashboard():
    st.header("📊 Direct Mail Insights Dashboard")
    st.caption("Competitive marketing data paired with expert analysis to drive your business")

    # Sidebar filters
    st.sidebar.header("🔍 Filters")
    selected_institutions = st.sidebar.multiselect("Institutions Name", df["company_name"].unique(), default=df["company_name"].unique())
    selected_product = st.sidebar.multiselect("Product", df["product"].unique(), default=df["product"].unique())
    selected_rewards = st.sidebar.multiselect("Rewards Program", df["rewards_program"].unique(), default=df["rewards_program"].unique())
    month_order = list(calendar.month_name)[1:]
    selected_month = st.sidebar.multiselect("Month", options=month_order, default=month_order)
    selected_quarter = st.sidebar.multiselect("Quarter", df["quarter"].unique(), default=df["quarter"].unique())
    selected_year = st.sidebar.multiselect("Year", df["year"].unique(), default=df["year"].unique())
    selected_category = st.sidebar.multiselect("Category", df["category"].unique(), default=df["category"].unique())
    selected_dma = st.sidebar.multiselect("Panel DMA", df["panel_dma"].unique(), default=df["panel_dma"].unique())

    filtered_df = df[
        (df["company_name"].isin(selected_institutions)) &
        (df["product"].isin(selected_product)) &
        (df["rewards_program"].isin(selected_rewards)) &
        (df["month_name"].isin(selected_month)) &
        (df["quarter"].isin(selected_quarter)) &
        (df["year"].isin(selected_year)) &
        (df["category"].isin(selected_category)) &
        (df["panel_dma"].isin(selected_dma))
    ]

    # Sidebar actions: Logout + Export CSV
    sidebar_actions(filtered_df)

    if filtered_df.empty:
        st.warning("⚠️ No data found for the selected filters.")
        return
    else:
        st.success(f"Showing {len(filtered_df):,} rows after filtering.")

    # Metrics
    col1, col2, col3 = st.columns(3)
    with col1:
        st.metric(label="💰 Total Spend", value=f"${filtered_df['spend'].sum()/1000:,.0f}K")
    with col2:
        st.metric(label="📬 Mail Volume", value=f"{filtered_df['estimated_mail_volume'].sum():,}")
    with col3:
        st.metric(label="🏢 Institutions", value=f"{filtered_df['company_name'].nunique()}")

    st.markdown("---")

    # Trend chart
    st.subheader("📈 Monthly Spend Trend")
    filtered_df['month_name'] = pd.Categorical(filtered_df['month_name'], categories=month_order, ordered=True)
    trend_df = filtered_df.groupby("month_name", observed=False).agg({"spend":"sum"}).reset_index()
    trend_df.rename(columns={"month_name": "Month"}, inplace=True)
    trend_df["Cumulative_Spend"] = trend_df["spend"].cumsum()

    fig_line = go.Figure()
    fig_line.add_trace(go.Scatter(x=trend_df["Month"], y=trend_df["spend"], mode='lines+markers',
                                  name="Monthly Spend", line=dict(color="#66FCF1", width=3)))
    fig_line.add_trace(go.Scatter(x=trend_df["Month"], y=trend_df["Cumulative_Spend"], mode='lines+markers',
                                  name="Cumulative Spend", line=dict(color="#C3073F", width=3, dash='dash')))
    fig_line.update_layout(
        xaxis_title="Month",
        yaxis_title="Spend ($)",
        template="plotly_dark",
        legend=dict(orientation="h", y=1.1, x=0.5, xanchor='center')
    )
    st.plotly_chart(fig_line, use_container_width=True)

    st.markdown("---")

    # Bar Chart
    st.subheader("📊 Category Distribution")
    bar_df = filtered_df.groupby("category", observed=False).agg({"spend":"sum"}).reset_index()
    fig_bar = go.Figure(data=[
        go.Bar(x=bar_df["category"], y=bar_df["spend"], marker=dict(color="#45A29E"))
    ])
    fig_bar.update_layout(
        xaxis_title="Category",
        yaxis_title="Total Spend",
        template="plotly_dark"
    )
    st.plotly_chart(fig_bar, use_container_width=True)

    # Pie Chart (Company Spend Share in %)
    st.subheader("📈 Company Spend Share (%)")
    pie_df = (
        filtered_df.groupby("company_name", observed=False)
        .agg({"spend": "sum"})
        .reset_index()
        .sort_values("spend", ascending=False)
    )

    fig_pie = go.Figure(
        data=[
            go.Pie(
                labels=pie_df["company_name"],
                values=pie_df["spend"],
                hole=0.4,
                textinfo="label+percent",
                insidetextorientation="radial"
            )
        ]
    )
    fig_pie.update_traces(marker=dict(line=dict(color="#000000", width=2)))
    fig_pie.update_layout(
        template="plotly_dark",
        legend=dict(orientation="v", y=1, x=1),
        margin=dict(t=50, b=50, l=25, r=25)
    )
    st.plotly_chart(fig_pie, use_container_width=True)

#######################################
# RUN APP
#######################################
if not st.session_state["authenticated"]:
    login_page()
else:
    dashboard()
