import pandas as pd

# Creating a new dataset
data = {
    "Employee_ID": [101, 102, 103, 104, 105, 106],
    "Name": ["Rajesh", "Meena", "Suresh", "Anita", "Vijay", "Neeta"],
    "Department": ["HR", "IT", "Finance", "IT", "Finance", "HR"],
    "Age": [29, 35, 45, 32, 50, 28],
    "Salary": [70000, 85000, 95000, 64000, 120000, 72000],
    "City": ["Delhi", "Mumbai", "Bangalore", "Chennai", "Delhi", "Mumbai"]
}

df = pd.DataFrame(data)
print(df)
print("---------------------------------------------------------------------------------------------------------------------------")
#
#
# Exercise 1: Rename Columns
# Rename the "Salary" column to "Annual Salary" and "City" to "Location".
# Print the updated DataFrame.

df_renamed = df.rename(columns={"Salary":"Annual Salary","City":"Location"})
print(df_renamed)

print("---------------------------------------------------------------------------------------------------------------------------")


# Exercise 2: Drop Columns
# Drop the "Location" column from the DataFrame.
# Print the DataFrame after dropping the column.

df_drop = df_renamed.drop(columns="Location")
print(df_drop)

print("---------------------------------------------------------------------------------------------------------------------------")

# Exercise 3: Drop Rows
# Drop the row where "Name" is "Suresh".
# Print the updated DataFrame.

drop_row = df[df["Name"] !="Suresh"]
print(drop_row)

print("---------------------------------------------------------------------------------------------------------------------------")

# Exercise 4: Handle Missing Data
# Assign None to the "Salary" of "Meena".
# Fill the missing "Salary" value with the mean salary of the existing employees.
# Print the cleaned DataFrame.

df.loc[df["Name"] == "Meena", "Annual Salary"] = None

mean_salary = df["Annual Salary"].dropna().mean()

df["Annual Salary"].fillna(mean_salary, inplace=True)
print(df)

print("---------------------------------------------------------------------------------------------------------------------------")

# Exercise 5: Create Conditional Columns
# Create a new column "Seniority" that assigns "Senior" to employees aged 40 or above and "Junior" to employees younger than 40.
# Print the updated DataFrame.

df["Seniority"] = df["Age"].apply(lambda x: "Senior" if x >= 40 else "Junior")
print(df)

print("---------------------------------------------------------------------------------------------------------------------------")

# Exercise 6: Grouping and Aggregation
# Group the DataFrame by "Department" and calculate the average salary in each department.
# Print the grouped DataFrame.

grouped_df = df.groupby("Department")["Salary"].mean()
print(grouped_df)
