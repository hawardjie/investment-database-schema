CREATE TABLE Portfolios (
    InvestorID INT,
    StockID INT,
    QuantityOwned INT,
    FOREIGN KEY (InvestorID) REFERENCES Investors(InvestorID),
    FOREIGN KEY (StockID) REFERENCES Stocks(StockID),
    PRIMARY KEY (InvestorID, StockID)
);
