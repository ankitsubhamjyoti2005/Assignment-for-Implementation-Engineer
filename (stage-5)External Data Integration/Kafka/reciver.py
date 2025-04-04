from kafka import KafkaConsumer
import json

consumer = KafkaConsumer(
    "stock_prices",
    bootstrap_servers=["broker1:9092", "broker2:9092"],
    value_deserializer=lambda x: json.loads(x.decode("utf-8")),
)

for message in consumer:
    print(f"Received stock data: {message.value}")
