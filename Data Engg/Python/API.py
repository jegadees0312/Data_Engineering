import requests
import pandas as ps

response = requests.get("https://dummyjson.com/products/1")
print(response.json())  #print the HTTP status code