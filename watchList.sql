CREATE TABLE Watchlist (
    WatchlistID INT PRIMARY KEY,
    InvestorID INT,
    StockID INT,
    AddedDate DATE,
    FOREIGN KEY (InvestorID) REFERENCES Investors(InvestorID),
    FOREIGN KEY (StockID) REFERENCES Stocks(StockID)
);
