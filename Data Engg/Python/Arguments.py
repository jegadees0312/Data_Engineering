# Arguments
# Keyword Argument
def describe_pets(pet_name,animal_type="Dog"):
    print(f"I have a {animal_type} named {pet_name}.")

# Using keyword Arguments, Default argument
describe_pets(animal_type="Cat",pet_name="kitty")
describe_pets(pet_name="john")

# Arbitary arguments
def make_pizza(size,*toppings):
    print(f"making a {size} inch pizza with the following toppings:")
    for topping in toppings:
        print(f"   -{topping}")

#calling with arbitary positional arguments
make_pizza(12,"pepperni","mushrooms","green chillies")

# Arbitary keyword Arguments
def build_profile(first,last,**user_info):
    return {"first_name":first,"last_name":last,**user_info}

# calling with arbitary keyword arguments
user_profile = build_profile("john","doe",location="New York",field ="Engineering")
print(user_profile)