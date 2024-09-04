empty_List = []

numbers_list = [1, 2, 3, 4, 5, 6]

Mixed_list =[2,'hi',22.4,"hello",5]

print(empty_List)
print(numbers_list)
print(Mixed_list)

numbers = [1,2,3,4,5,6,7,8]

numbers.append(10)

numbers.insert(10,11)

numbers.extend([12,13,14])

numbers.remove(14)  # Remove by element

numbers.pop(1)   #Remove by Index

# Slicing a List
numbers = [1,2,3,4,5,6]

First_three = numbers[:3]
From_one_to_three = numbers[1:3]
last_two = numbers[-2:]

print(First_three)
print(From_one_to_three)
print(last_two)

# Iterating over a list
for num in numbers:
    print(num)

# creating a list of squares using list comprehension
squares = [x**2 for x in range(6)]
print("Squares",squares)

