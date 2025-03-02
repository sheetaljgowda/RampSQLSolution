WITH transaction_data AS (
    SELECT 
        DATE(transaction_time) AS transaction_date, 
        SUM(transaction_amount) AS total_transaction_amount
    FROM transactions
    GROUP BY transaction_date
)
SELECT 
    transaction_date,
    AVG(total_transaction_amount) OVER (ORDER BY transaction_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS rolling_3_day_avg
FROM transaction_data
WHERE transaction_date = '2021-01-31';
