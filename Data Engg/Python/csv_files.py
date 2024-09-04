
import csv

# witing data to a CSV file
data=[["Name","Age"],["Alice",24],["John",30]]

with open("csv" ,"w",newline="") as file:
            writer = csv.writer(file)
            writer.writerows(data)

# Reading data froma CSV file
with open("csv","r") as file:
        reader = csv.reader(file)
        for row in reader:
                print(row)