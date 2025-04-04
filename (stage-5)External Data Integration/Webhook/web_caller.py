import requests

def send_webhook(symbol, price, timestamp):
    url = "http://webhook-server:4000/webhook/stock-update"
    data = {"symbol": symbol, "price": price, "timestamp": timestamp}
    headers = {"Content-Type": "application/json"}
    response = requests.post(url, json=data, headers=headers)
    return response.status_code

# Example
send_webhook("AAPL", 172.34, "2025-04-01T14:00:00Z")
