import requests
import os

ALPHA_VANTAGE_API_KEY = os.getenv("ALPHA_VANTAGE_API_KEY")

def get_stock_price(symbol):
    url = f"https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol={symbol}&interval=5min&apikey={ALPHA_VANTAGE_API_KEY}"
    response = requests.get(url)
    data = response.json()
    
    if "Time Series (5min)" in data:
        latest_timestamp = list(data["Time Series (5min)"].keys())[0]
        latest_price = data["Time Series (5min)"][latest_timestamp]["1. open"]
        return {"symbol": symbol, "price": latest_price, "timestamp": latest_timestamp}
    
    return {"error": "Failed to fetch stock price"}

# Example Usage
print(get_stock_price("AAPL"))
