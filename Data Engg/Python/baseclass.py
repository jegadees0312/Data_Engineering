# base class(parent class)
class Animals:
    def __init__(self,name):
        self.name =name

    def speak(self):
        print("Animal Speaks",self.name)

# derived class (child class)
class Dog(Animals):

     def speak(self):
         return "bow !"
ani = Animals("cat")
obj =Dog("jack")
print(f"{obj.name} says {obj.speak()}")