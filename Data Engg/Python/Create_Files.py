file_path ="python_file"

# #open file in write mode and write content
# with open(file_path,"w") as file:
#     file.write("hello ,This is the content written to your file")
#
# print("File created and content written successfully")

# # open a file in read mode and print each line
# with open(file_path,"r") as file:
#     for line in file:
#             print(line.strip())     #remove newline characters \n
#
# # open a file in append mode and add new contents
# with open(file_path,"a") as file:
#     file.write("This is additional comment add it to the file")

with open(file_path,"r") as file:
    content = file.read()
    print(content)