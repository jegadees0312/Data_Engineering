empty_dict = {}

person = {
    "Name":"john",
    "Age":30,
    "email":"john@gmail.com"
}

# Accessing values
name = person["Name"]
age = person["Age"]
print("Name: ",name)
print("Age: ",age)

# Modify values
person["Age"] = 31
person["email"] = "john_new@gmail.com"

keys=person.keys()
values=person.values()
items  = person.items()

print("keys : ",keys)
print("values : ",values)
print("items : ",items)

#iterating over keys
for key in person:
        print(key)

#iterating over values
for value in person.values():
        print(value)

#iterating over key-value pairs
for key,value in person.items():
        print(key,":",value )