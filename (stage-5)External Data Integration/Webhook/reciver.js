const express = require('express');
const app = express();
app.use(express.json());

app.post('/webhook/stock-update', (req, res) => {
    const { symbol, price, timestamp } = req.body;
    console.log(`Stock Update - ${symbol}: $${price} at ${timestamp}`);
    res.sendStatus(200);
});

app.listen(4000, () => console.log('Webhook server running on port 4000'));
