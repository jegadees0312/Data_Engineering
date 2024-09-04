import pandas as pd

# sample dataframes
df1 = pd.DataFrame({
    'employee_id':[1,2,3,4],
    'employee_name':['john Doe','Jane smith','Sam Brown','Emily Davis']
})
df2 = pd.DataFrame({
    'employee_id':[3,4,5,6],
    'department':['Finance','HR','IT','Marketing']
})

# merge the DataFrames on employee_id
merge_df =pd.merge(df1,df2,on="employee_id",how="right")
print(merge_df)

print("---------------------------------------------------------------------------")

dff = pd.DataFrame({
    'employee_id':[1,2,2,3,3,3],
    'department':['HR','IT','IT','Finance','Finance','Finance'],
    'salary':[50000,60000,62000,55000,58000,60000]
})

# Group by department and calculate mean salary
df_group = dff.groupby('department')['salary'].mean()
print(df_group)