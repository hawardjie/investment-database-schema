# investment-database-schema

Database schema for managing stock investments involves designing tables that can handle information about investors, stocks, transactions, portfolios, and possibly market data.

Below is the schema that includes tables to cover requirements in a stock investment system.

## Investors

This table stores information about each investor.

```SQL
CREATE TABLE Investors (
    InvestorID INT PRIMARY KEY,
    FullName VARCHAR(255),
    Email VARCHAR(255),
    ContactNumber VARCHAR(15)
);
```

## Stocks

This table records details about different stocks available for investment.

```SQL
CREATE TABLE Stocks (
    StockID INT PRIMARY KEY,
    TickerSymbol VARCHAR(10),
    CompanyName VARCHAR(255),
    Market VARCHAR(50)  -- e.g., NYSE, NASDAQ
);
```

## Transactions

This table tracks each buy or sell transaction made by investors.

```SQL
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
```

## Portfolio

This table links investors to the stocks they own and tracts the quantity of each stock.

```SQL
CREATE TABLE Portfolios (
    InvestorID INT,
    StockID INT,
    QuantityOwned INT,
    FOREIGN KEY (InvestorID) REFERENCES Investors(InvestorID),
    FOREIGN KEY (StockID) REFERENCES Stocks(StockID),
    PRIMARY KEY (InvestorID, StockID)
);
```

## Market Data

This optional table can store historical or current price data for various stocks.

```SQL
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
```

## Watchlist

This table is used to keep track of the stocks that an investor is monitoring but not necessarily owning them.

```SQL
CREATE TABLE Watchlist (
    WatchlistID INT PRIMARY KEY,
    InvestorID INT,
    StockID INT,
    AddedDate DATE,
    FOREIGN KEY (InvestorID) REFERENCES Investors(InvestorID),
    FOREIGN KEY (StockID) REFERENCES Stocks(StockID)
);
```
