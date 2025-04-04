from kafka import KafkaProducer
import json
import requests

producer = KafkaProducer(
    bootstrap_servers=["broker1:9092", "broker2:9092"],
    value_serializer=lambda x: json.dumps(x).encode("utf-8"),
)

def fetch_stock_price(symbol):
    url = f"https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol={symbol}&interval=5min&apikey=API_KEY"
    response = requests.get(url)
    data = response.json()
    if "Time Series (5min)" in data:
        latest_timestamp = list(data["Time Series (5min)"].keys())[0]
        latest_price = data["Time Series (5min)"][latest_timestamp]["1. open"]
        return {"symbol": symbol, "price": latest_price, "timestamp": latest_timestamp}
    return None

while True:
    stock_data = fetch_stock_price("AAPL")
    if stock_data:
        producer.send("stock_prices", stock_data)
