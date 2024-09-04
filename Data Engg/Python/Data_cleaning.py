
# Name, Age, City, Salary
#
# John Doe, 29, New York, 75000
#
# Jane Smith, 34, Los Angeles, 82000
#
# Sam Brown, 22, , 54000
#
# Emily Davis, , Chicago, 91000
#
# Michael Johnson, 45, Houston,
#
# Anna Lee, 30, San Francisco, 77000

# sample.csv data ^

import numpy as np
import pandas as pd

# Load CSV file
df = pd.read_csv("sample.csv")
print(df)

# Replace empty string or string with only space to NaN
df.replace(r'^\s*$',np.nan,regex=True,inplace=True)

# check for missing values in each column
print(df.isnull().sum())

# Display rows with missing data
print(df[df.isnull().any(axis =1)])

print("-----------------------------------------------------------------")

# Ensure there are no leading or trailing spaces in a column name
df.columns = df.columns.str.strip()

# Strip spaces from the 'city' column and replace strings with NaN
df['City'] = df['City'].str.strip().replace(" ",np.nan)

# Fill missing values in the column 'City' with 'Unknown'
df['City'] = df['City'].fillna("Unknown")

# Fill missing values in the 'Age' column with the median age
df['Age'] = pd.to_numeric(df['Age'].str.strip(),errors='coerce')
df['Age'] = df['Age'].fillna(df['Age'].median())

# Fill missing values  in the 'salary' column with the median salary
df['Salary'] = df['Salary'].fillna(df['Salary'].median())

# Final data frame after adding data
print(df)