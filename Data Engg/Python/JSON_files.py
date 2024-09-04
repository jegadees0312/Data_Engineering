
import json

# Writing data to a JSON file
data = {"Name" : "John","Age": 23,"City":"New York"}

with open("json_document","w") as file:
    json.dump(data,file)

# Reading data from a JSON file
with open("json_document","r") as file:
    loaded_data = json.load(file)
    print(loaded_data)