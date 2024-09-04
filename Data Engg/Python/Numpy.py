import numpy as np

# create a one dimensional array
arr = np.array([1,2,3,4,5])
print("Array : ",arr)

# Reshape to a 2x3 array
reshaped_array = np.arange(6).reshape(2,3)
print("Reshaped array :\n",reshaped_array)

# Element-wise addition
arr_add = arr + 10
print("Added 10 to each element : ",arr_add )

# element wise multiplication
arr_mul = arr * 2
print("Multiplied each element by 2 : ",arr_mul)

# Slicing array
sliced_arr = arr[1:4]  #get element from index 1 to 3
print("Sliced array : ",sliced_arr)