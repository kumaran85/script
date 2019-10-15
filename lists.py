#!/bin/python_new
varia=["ball", "tennis", "bat", "mice", "rabbbit"]
#insert items in particular index
varia.insert(2,"stump")
#it appends at the end of List
varia.append("mint")
for item in varia:
   print(item)

#counting number of intems in Lists
print(varia.count("bat"))

#finding items index in list
print(varia.index("mice"))

#sorting in reverse
print(varia.sort())

#To remvoe items in Lists
varia.remove()
print(varia)
