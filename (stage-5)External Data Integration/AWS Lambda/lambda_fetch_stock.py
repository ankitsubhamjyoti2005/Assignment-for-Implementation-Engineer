import json
import boto3
import requests
import os

ALPHA_VANTAGE_API_KEY = os.getenv("ALPHA_VANTAGE_API_KEY")
DYNAMODB_TABLE = "StockPrices"

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table(DYNAMODB_TABLE)

def lambda_handler(event, context):
    stock_symbol = event.get("symbol", "AAPL")
    url = f"https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol={stock_symbol}&interval=5min&apikey={ALPHA_VANTAGE_API_KEY}"
    
    response = requests.get(url)
    data = response.json()
    
    if "Time Series (5min)" in data:
        latest_timestamp = list(data["Time Series (5min)"].keys())[0]
        latest_price = data["Time Series (5min)"][latest_timestamp]["1. open"]

        # Store data in DynamoDB
        table.put_item(
            Item={
                "symbol": stock_symbol,
                "timestamp": latest_timestamp,
                "price": latest_price
            }
        )
        return {"message": "Stock price stored successfully", "symbol": stock_symbol, "price": latest_price}

    return {"error": "Failed to fetch stock price"}
