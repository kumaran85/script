#!/bin/python_new
first = 'Welcome to Python For Beginners'
print (first)
print (first[3])
print (first[4:])
print (first[-3])
print (len(first))
print (first.upper())
name = input ("Please enter to ask: " )
print (first.count('For'))

print (first.find('Python'))

#To replease the value
second = first.replace('Beginners' , 'Learnners')
print (second)
welcome = "Welcome"
AI = 'Machine Learning'

osd= '{} , to  {}'.format(welcome, AI)
one= f'{welcome} to {AI} '
print(one)
print (osd)
