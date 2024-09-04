# Exercise 1: Create a List
# Create a list called fruits with the following items: "apple", "banana", "cherry", "date", and "elderberry".
# Print the list.

Fruits =["apple", "banana", "cherry", "date", "elderberry"]
print(Fruits)

#----------------------------------------------------------------------------------------------------------------------------------------------------------
# Exercise 2: Access List Elements
# Print the first and last items from the fruits list.
# Print the second and fourth items from the list.

print("First element: ",Fruits[0])
print("Last element: ",Fruits[-1])
print("Second element: ",Fruits[1])
print("Fourth element: ",Fruits[3])

#----------------------------------------------------------------------------------------------------------------------------------------------------------

# Exercise 3: Modify a List
# Replace "banana" in the fruits list with "blueberry".
# Print the modified list.

Fruits[1] = 'blueberry'
print("Replaced list: ",Fruits)

#----------------------------------------------------------------------------------------------------------------------------------------------------------

# Exercise 4: Add and Remove Elements
# Append "fig" and "grape" to the fruits list.
# Remove "apple" from the list.
# Print the final list.

Fruits.extend(['fig','grape'])
Fruits.pop(0)

#----------------------------------------------------------------------------------------------------------------------------------------------------------

# Exercise 5: Slice a List
# Slice the first three elements from the fruits list and assign them to a new list called first_three_fruits.
# Print first_three_fruits.

first_three_fruits = Fruits[:3]
print("First three fruits: ",first_three_fruits)

#----------------------------------------------------------------------------------------------------------------------------------------------------------

# Exercise 6: Find List Length
# Find and print the length of the fruits list.

print("Length of List: ",len(Fruits))

#----------------------------------------------------------------------------------------------------------------------------------------------------------

# Exercise 7: List Concatenation
# Create a second list called vegetables with the following items: "carrot", "broccoli", "spinach".
# Concatenate the fruits and vegetables lists into a new list called food.
# Print the food list.

vegetables = ["carrot", "broccoli", "spinach"]
food = Fruits + vegetables
print("Food List: ",food)

#----------------------------------------------------------------------------------------------------------------------------------------------------------

# Exercise 8: Loop Through a List
# Loop through the fruits list and print each item on a new line.

for i in Fruits:
    print(i)

#----------------------------------------------------------------------------------------------------------------------------------------------------------

# Exercise 9: Check for Membership
# Check if "cherry" and "mango" are in the fruits list. Print a message for each check.

if 'cherry' in Fruits:
    print("It is present in fruits")
else:
    print("It is not present")

if 'mango' in Fruits:
    print("It is present in fruits")
else:
    print("It is not present")

#----------------------------------------------------------------------------------------------------------------------------------------------------------

# Exercise 10: List Comprehension
# Use list comprehension to create a new list called fruit_lengths that contains the lengths of each item in the fruits list.
# Print the fruit_lengths list.

fruit_length = [len(fruit) for fruit in Fruits]
print("Fruit length list: ",fruit_length)

#----------------------------------------------------------------------------------------------------------------------------------------------------------

# Exercise 11: Sort a List
# Sort the fruits list in alphabetical order and print it.
# Sort the fruits list in reverse alphabetical order and print it.

sort = sorted(Fruits)
reverse_sort = sort[::-1]
print("Alphabetical order: ",sort)
print("Reverse Alphabetical order: ",reverse_sort)

#----------------------------------------------------------------------------------------------------------------------------------------------------------

# Exercise 12: Nested Lists
# Create a list called nested_list that contains two lists: one with the first three fruits and one with the last three fruits.
# Access the first element of the second list inside nested_list and print it.

nested_list = [Fruits[:3],Fruits[-3:]]
print("First element of second list: ",nested_list[1][0])

#----------------------------------------------------------------------------------------------------------------------------------------------------------

# Exercise 13: Remove Duplicates
# Create a list called numbers with the following elements: [1, 2, 2, 3, 4, 4, 4, 5].
# Remove the duplicates from the list and print the list of unique numbers.

numbers = [1, 2, 2, 3, 4, 4, 4, 5]
unique_numbers = []
[unique_numbers.append(i) for i in numbers if i not in unique_numbers]
print("List of Unique Numbers: ",unique_numbers)

#----------------------------------------------------------------------------------------------------------------------------------------------------------

# Exercise 14: Split and Join Strings
# Split the string "hello, world, python, programming" into a list called words using the comma as a delimiter.
# Join the words list back into a string using a space as the separator and print it.

string = "hello, world, python, programming"
words = string.split(", ")
joined_string = " ".join(words)
print("List back to string:" ,joined_string)


#----------------------------------------------------------------------------------------------------------------------------------------------------------
