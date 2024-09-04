import pandas as pd

# creating a Dataframe from a dictionary with indian names
data = {
    "Name" : ["Amit","priya","Vikram","Neha","Ravi"],
    "Age" :[25,30,35,40,45],
    "City" : ["Mumbai","Delhi","Bangalore","Chennai","Pune"]
}

df = pd.DataFrame(data)
print(df)
print("------------------------------------------------------------------------------------------------------------------------------")

# Accessing a single column
print(df["Name"])
print("------------------------------------------------------------------------------------------------------------------------------")

#Accessing multiple column
print(df[["Name","Age"]])
print("------------------------------------------------------------------------------------------------------------------------------")

# Accessing rows using index
print(df.iloc[0])
print("------------------------------------------------------------------------------------------------------------------------------")

# Filter rows where Age is gretaer > 30
filtered_df = df[df["Age"] > 30]
print(filtered_df)
print("------------------------------------------------------------------------------------------------------------------------------")

# Adding a new column
df["Salary"] = [50000,60000,70000,80000,90000]
print(df)
print("------------------------------------------------------------------------------------------------------------------------------")

# Sorting by age
sorted_df = df.sort_values(by="Age", ascending=False)
print(sorted_df)
print("------------------------------------------------------------------------------------------------------------------------------")

# Rename the "name" column to 'FullName' and 'Age' to years
df_renamed = df.rename(columns={"Name":"Full Name","Age":"Years"})
print(df_renamed)
print("------------------------------------------------------------------------------------------------------------------------------")

# Drop the 'City' column
df_dropped = df.drop(columns=["City"])
print(df_dropped)
print("------------------------------------------------------------------------------------------------------------------------------")

# Drop row
df_dropped_row = df.drop(index = 2)
print(df_dropped_row)
print("------------------------------------------------------------------------------------------------------------------------------")

# Create a new column 'seniority' based on the age
df['Seniority'] = df['Age'].apply(lambda x: 'senior' if x>= 35 else 'junior')
print(df)
print("------------------------------------------------------------------------------------------------------------------------------")

# Group by 'city' and calculate the average Salary in each city
df_grouped = df.groupby("City")["Salary"].mean()
print(df_grouped)
print("------------------------------------------------------------------------------------------------------------------------------")

# Apply a custom function to salary column to add a 10 % bonus
def add_bonus(salary):
    return salary * 1.10

df["Salary_with_Bonus"] = df['Salary'].apply(add_bonus)
print(df)
print("------------------------------------------------------------------------------------------------------------------------------")

# Create another DataFrame
df_new = pd.DataFrame({
    "Name": ["Amit","Priya","Ravi"],
    "Bonus": [5000,6000,7000]
})
# merge based on the "Name" column
df_merged = pd.merge(df,df_new,on ="Name",how ="left")
print(df_merged)
print("------------------------------------------------------------------------------------------------------------------------------")

# Create anothe DataFrame to concatenate
df_new = pd.DataFrame({
    "Name" :["Sonia","Rahul"],
    "Age" :[29,31],
    "City":["kolkata","Hyderabad"],
    "Salary": [58000,63000]
})

#Concatenate the two DataFrame
df_concat = pd.concat([df,df_new],ignore_index=True)
print(df_concat)
print("------------------------------------------------------------------------------------------------------------------------------")

# Salary above 50000
df_salary = df[df["Salary"]>50000]
print(df_salary)
print("------------------------------------------------------------------------------------------------------------------------------")

# Name starts with a
name_starts_with_a = df[df["Name"].str.startswith("A")]
print(name_starts_with_a)