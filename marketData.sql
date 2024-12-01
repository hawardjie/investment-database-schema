CREATE TABLE MarketData (
    StockID INT,
    Date DATE,
    OpenPrice DECIMAL(10, 2),
    ClosePrice DECIMAL(10, 2),
    HighPrice DECIMAL(10, 2),
    LowPrice DECIMAL(10, 2),
    Volume BIGINT,
    FOREIGN KEY (StockID) REFERENCES Stocks(StockID),
    PRIMARY KEY (StockID, Date)
);
