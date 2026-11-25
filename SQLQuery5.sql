WITH CustomerOrders AS (
    SELECT
        Customer_ID,
        COUNT(*) AS Total_Orders,
        SUM(Total_Amount) AS Total_Spending
    FROM sales
    GROUP BY Customer_ID
)
SELECT
    CASE
        WHEN Total_Orders = 1 THEN 'One-time Customer'
        ELSE 'Repeat Customer'
    END AS Customer_Type,
    COUNT(*) AS Total_Customers,
    SUM(Total_Spending) AS Total_Revenue
FROM CustomerOrders
GROUP BY
    CASE
        WHEN Total_Orders = 1 THEN 'One-time Customer'
        ELSE 'Repeat Customer'
    END;

SELECT
    COUNT(DISTINCT Customer_ID) AS Unique_Customers,
    COUNT(*) AS Total_Transactions
FROM sales;