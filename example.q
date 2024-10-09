// Create a simple table with stock prices
stocks: (`symbol`price`date) ! (enlist `AAPL; 150.25; 2024.10.01)

// Add more rows to the table
stocks: stocks upsert (`GOOGL; 2750.60; 2024.10.01)
stocks: stocks upsert (`TSLA; 800.00; 2024.10.01)

// Select stocks where price is greater than 1000
select from stocks where price > 1000
