from urllib import request
from wsgiref import headers
import requests
data = requests.get("https://rest.coinapi.io/v1/assets",headers={"X-CoinAPI-Key": "121A6F4C-8EEA-4E3D-9405-23900B633B34"})
print(data.json())
