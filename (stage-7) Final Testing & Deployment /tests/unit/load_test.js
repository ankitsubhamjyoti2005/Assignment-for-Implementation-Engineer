import http from "k6/http";
import { check } from "k6";

export let options = {
  vus: 100, // 100 concurrent users
  duration: "1m",
};

export default function () {
  let res = http.get("https://onfinance.example.com/api/stocks");
  check(res, {
    "is status 200": (r) => r.status === 200,
  });
}
