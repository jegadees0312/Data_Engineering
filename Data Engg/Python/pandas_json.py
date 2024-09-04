# [ {"Employee_ID": 101, "Name": "Rajesh", "Department": "HR", "Age": 29, "Salary": 70000, "City": "Delhi"}, {"Employee_ID": 102, "Name": "Meena", "Department": "IT", "Age": 35, "Salary": 85000, "City": "Mumbai"}, {"Employee_ID": 103, "Name": "Suresh", "Department": "Finance", "Age": 45, "Salary": 95000, "City": "Bangalore"}, {"Employee_ID": 104, "Name": "Anita", "Department": "IT", "Age": 32, "Salary": 64000, "City": "Chennai"}, {"Employee_ID": 105, "Name": "Vijay", "Department": "Finance", "Age": 50, "Salary": 120000, "City": "Delhi"}, {"Employee_ID": 106, "Name": "Neeta", "Department": "HR", "Age": 28, "Salary": 72000, "City": "Mumbai"} ]
# json data ^

import pandas as pd

# Load tha json file into a DataFrame
df = pd.read_json('employee.json')
print(df)

# Add a new column "Bonus" which is 10% of the salary
df["Bonus"] =df["Salary"] * 0.10
print(df)

# Save the updated DataFrame to a new JSON file
df.to_json('employee_with_bonus.json',orient='records',line=True)
