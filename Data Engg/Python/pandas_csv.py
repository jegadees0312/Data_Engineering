# Employee_ID,Name,Department,Age,Salary,City
# 101,Rajesh,HR,29,70000,Delhi
# 102,Meena,IT,35,85000,Mumbai
# 103,Suresh,Finance,45,95000,Bangalore
# 104,Anita,IT,32,64000,Chennai
# 105,Vijay,Finance,50,120000,Delhi
# 106,Neeta,HR,28,72000,Mumbai

#employee.csv -^

import pandas as pd

#Load csv file into a dataframe
df = pd.read_csv('employee.csv')
print(df)

# Display the first three rows
print(df.head(3))

# Show summary information about the dataframe
print(df.info())

# Display summary statistics of numeric columns
print(df.describe())

# filter rows where Salary above 80000
high_salary_df = df[df['Salary'] > 80000]
print(high_salary_df)

# Sort by age in descending order
sorted_df = df.sort_values(by='Age',ascending=False)
print(sorted_df)