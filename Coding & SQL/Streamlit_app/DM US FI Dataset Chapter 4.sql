-- 1. Select Database
USE DM_FI_Database;

-- 2. Since I've build table before to avoid redundant, I sued drop the table if it already exists to avoid errors
DROP TABLE IF EXISTS DMFinancialInstitutionsData;

-- 3. Create Table
CREATE TABLE DMFinancialInstitutionsData (
    ID INT PRIMARY KEY,
    Company_Name VARCHAR(255),
    Product VARCHAR(255),
    Rewards_Program VARCHAR(255),
    Month VARCHAR(20),
    Quarter VARCHAR(20),
    Year INT,
    Category VARCHAR(100),
    Panel_DMA VARCHAR(100),
    Estimated_Mail_Volume INT,
    Spend DECIMAL(15,2)
);

-- 4. Insert Sample Data
INSERT INTO DMFinancialInstitutionsData (
    ID, Company_Name, Product, Rewards_Program, Month, Quarter, Year, Category, Panel_DMA, Estimated_Mail_Volume, Spend
) VALUES
(1,'Citibank', 'Citi Checking Account', 'Not Specified', 'Nov-22', '2022 Q4', 2022, 'Checking', 'New York, NY', 2989937, 1566231.00),
(2, 'American Express', 'American Express High Yield Savings Account', 'Not Specified', 'May-24', '2024 Q2', 2024, 'Savings', 'Los Angeles, CA', 2667156, 782620.00),
(3, 'American Express', 'American Express High Yield Savings Account', 'Not Specified', 'Jan-24', '2024 Q1', 2024, 'Savings', 'New York, NY', 2534503, 741431.00),
(4, 'American Express', 'American Express High Yield Savings Account', 'Not Specified', 'Mar-25', '2025 Q1', 2025, 'Savings', 'Los Angeles, CA', 2532016, 735639.00),
(5, 'American Express', 'American Express High Yield Savings Account', 'Not Specified', 'May-24', '2024 Q2', 2024, 'Savings', 'New York, NY', 2469819, 722103.00),
(6, 'American Express', 'High Yield Savings Account', 'Not Specified', 'Nov-24', '2024 Q4', 2024, 'Savings', 'New York, NY', 2353946, 681925.00),
(7, 'American Express', 'High Yield Savings Account', 'Not Specified', 'Aug-22', '2022 Q3', 2022, 'Savings', 'New York, NY', 2298227, 675257.00),
(8, 'American Express', 'High Yield Savings Account', 'Not Specified', 'Jan-23', '2023 Q1', 2023, 'Savings', 'Los Angeles, CA', 2235329, 649165.00),
(9, 'American Express', 'American Express High Yield Savings Account', 'Not Specified', 'Mar-25', '2025 Q1', 2025, 'Savings', 'New York, NY', 2232363, 653657.00),
(10, 'American Express', 'American Express High Yield Savings Account', 'Cashback/cash rebate, Not Specified', 'Apr-23', '2023 Q2', 2023, 'Savings', 'Los Angeles, CA', 2203071, 686159.00),
(11, 'American Express', 'American Express High Yield Savings Account', 'Not Specified', 'Jan-24', '2024 Q1', 2024, 'Savings', 'Los Angeles, CA', 2125312, 615647.00),
(12, 'American Express', 'American Express High Yield Savings Account', 'Not Specified', 'Feb-25', '2025 Q1', 2025, 'Savings', 'New York, NY', 1985976, 580868.00),
(13, 'American Express', 'High Yield Savings Account', 'Not Specified', 'Nov-24', '2024 Q4', 2024, 'Savings', 'Los Angeles, CA', 1960212, 564541.00),
(14, 'American Express', 'American Express High Yield Savings Account', 'Not Specified', 'Sep-22', '2022 Q3', 2022, 'Savings', 'Los Angeles, CA', 1911330, 581954.00),
(15, 'American Express', 'American Express High Yield Savings Account', 'Not Specified', 'Oct-23', '2023 Q4', 2023, 'Savings', 'Los Angeles, CA', 1826125, 563360.00),
(16, 'American Express', 'High Yield Savings Account', 'Not Specified', 'Jan-23', '2023 Q1', 2023, 'Savings', 'New York, NY', 1813643, 527397.00),
(17, 'Citibank', 'Citi Checking Account', 'Not Specified', 'Nov-22', '2022 Q4', 2022, 'Checking', 'Washington, DC', 1791527, 919949.00),
(18, 'American Express', 'American Express High Yield Savings Account', 'Not Specified', 'Sep-24', '2024 Q3', 2024, 'Savings', 'New York, NY', 1718218, 508055.00),
(19, 'Citibank', 'Consumer Checking Account', 'Not Specified', 'Aug-23', '2023 Q3', 2023, 'Checking', 'New York, NY', 1712288, 870001.00),
(20, 'American Express', 'American Express High Yield Savings Account', 'Not Specified', 'Oct-22', '2022 Q4', 2022, 'Savings', 'New York, NY', 1683163, 489018.00),
(21, 'American Express', 'American Express High Yield Savings Account', 'Not Specified', 'Oct-22', '2022 Q4', 2022, 'Savings', 'New York, NY', 1683163, 489018.00),
(22, 'American Express', 'American Express High Yield Savings Account', 'Not Specified', 'Oct-23', '2023 Q4', 2023, 'Savings', 'New York, NY', 1656427, 512812.00),
(23, 'American Express', 'American Express High Yield Savings Account', 'Not Specified', 'Jul-24', '2024 Q3', 2024, 'Savings', 'New York, NY', 1649916, 532607.00),
(24, 'American Express', 'High Yield Savings Account', 'Not Specified', 'May-22', '2022 Q2', 2022, 'Savings', 'Los Angeles, CA', 1600400, 483961.00),
(25, 'American Express', 'American Express High Yield Savings Account', 'Not Specified', 'Feb-25', '2025 Q1', 2025, 'Savings', 'Los Angeles, CA', 1570781, 452385.00),
(26, 'American Express', 'American Express High Yield Savings Account', 'Not Specified', 'Mar-25', '2025 Q1', 2025, 'Savings', 'San Francisco-Oakland-San Jose, CA', 1565720, 460238.00),
(27, 'American Express', 'American Express High Yield Savings Account', 'Not Specified', 'Mar-24', '2024 Q1', 2024, 'Savings', 'New York, NY', 1504531, 433305.00),
(28, 'American Express', 'American Express High Yield Savings Account', 'Not Specified', 'Oct-22', '2022 Q4', 2022, 'Savings', 'Atlanta, GA', 1500592, 452243.00),
(29, 'American Express', 'American Express High Yield Savings Account', 'Not Specified', 'Mar-25', '2025 Q1', 2025, 'Savings', 'Atlanta, GA', 1491438, 432390.00),
(30, 'American Express', 'American Express High Yield Savings Account', 'Not Specified', 'Mar-24', '2024 Q1', 2024, 'Savings', 'Los Angeles, CA', 1482142, 428949.00),
(31, 'American Express', 'High Yield Savings Account', 'Not Specified', 'Aug-22', '2022 Q3', 2022, 'Savings', 'Atlanta, GA', 1478614, 481113.00),
(32, 'American Express', 'High Yield Savings Account', 'Not Specified', 'May-22', '2022 Q2', 2022, 'Savings', 'New York, NY', 1460764, 494269.00),
(33, 'American Express', 'American Express High Yield Savings Account', 'Not Specified', 'Jan-24', '2024 Q1', 2024, 'Savings', 'Tampa-St. Petersburg-Sarasota, FL', 1414156, 409115.00),
(34, 'Citibank', 'Citi Checking Account', 'Not Specified', 'May-22', '2022 Q2', 2022, 'Checking', 'New York, NY', 1384663, 711024.00),
(35, 'American Express', 'High Yield Savings Account', 'Not Specified', 'Aug-22', '2022 Q3', 2022, 'Savings', 'Los Angeles, CA', 1354305, 392677.00),
(36, 'American Express', 'High Yield Savings Account', 'Not Specified', 'Aug-22', '2022 Q3', 2022, 'Savings', 'Washington, DC', 1341522, 390531.00),
(37, 'Citibank', 'Consumer Checking Account', 'Not Specified', 'Mar-23', '2023 Q1', 2023, 'Checking', 'New York, NY', 1338343, 703058.00),
(38, 'American Express', 'High Yield Savings Account', 'Not Specified', 'Aug-22', '2022 Q3', 2022, 'Savings', 'Boston, MA', 1336251, 392553.00),
(39, 'American Express', 'High Yield Savings Account', 'Not Specified', 'Jun-23', '2023 Q2', 2023, 'Savings', 'Los Angeles, CA', 1335406, 389366.00),
(40, 'American Express', 'American Express High Yield Savings Account', 'Not Specified', 'Feb-25', '2025 Q1', 2025, 'Savings', 'Atlanta, GA', 1333345, 395364.00),
(41, 'Citibank', 'Citi Checking Account', 'Miles, Not Specified', 'Nov-22', '2022 Q4', 2022, 'Checking', 'Los Angeles, CA', 1332169, 730142.00),
(42, 'Citibank', 'Citi Checking Account', 'Not Specified', 'May-22', '2022 Q2', 2022, 'Checking', 'Los Angeles, CA', 1297690, 702915.00),
(43, 'American Express', 'American Express High Yield Savings Account', 'Not Specified', 'Mar-25', '2025 Q1', 2025, 'Savings', 'Boston, MA', 1256501, 364300.00),
(44, 'American Express', 'American Express High Yield Savings Account', 'Not Specified', 'Jan-24', '2024 Q1', 2024, 'Savings', 'Boston, MA', 1239404, 356948.00),
(45, 'American Express', 'American Express High Yield Savings Account', 'Not Specified', 'Aug-23', '2023 Q3', 2023, 'Savings', 'Los Angeles, CA', 1233025, 359023.00),
(46, 'American Express', 'American Express High Yield Savings Account', 'Not Specified', 'Jul-24', '2024 Q3', 2024, 'Savings', 'Los Angeles, CA', 1211459, 368007.00),
(47, 'American Express', 'American Express High Yield Savings Account', 'Not Specified', 'Jul-24', '2024 Q3', 2024, 'Savings', 'Los Angeles, CA', 1211459, 368007.00),
(48, 'American Express', 'American Express High Yield Savings Account', 'Not Specified', 'Feb-25', '2025 Q1', 2025, 'Savings', 'San Francisco-Oakland-San Jose, CA', 1185804, 341512.00),
(49, 'American Express', 'High Yield Savings Account', 'Not Specified', 'Jun-23', '2023 Q2', 2023, 'Savings', 'New York, NY', 1174845, 339797.00),
(50, 'American Express', 'High Yield Savings Account', 'Not Specified', 'Jun-22', '2022 Q2', 2022, 'Savings', 'Los Angeles, CA', 1167571, 402217.00);

-- 5. Verify Table Contents
SELECT * FROM DMFinancialInstitutionsData LIMIT 50;



