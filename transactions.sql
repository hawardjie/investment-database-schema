CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    InvestorID INT,
    StockID INT,
    TransactionType ENUM('BUY', 'SELL'),
    Quantity INT,
    PricePerShare DECIMAL(10, 2),
    TransactionDate DATE,
    FOREIGN KEY (InvestorID) REFERENCES Investors(InvestorID),
    FOREIGN KEY (StockID) REFERENCES Stocks(StockID)
);
