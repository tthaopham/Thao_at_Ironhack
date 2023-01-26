import random
import re

# this function generate password with length of n*4 (4 being 4 sets of characters)
def generate_password():
    character_number = [chr(i) for i in range(48,57)]
    character_symbol = [chr(i) for i in range(33,47)]
    character_lower = [chr(i) for i in range(97,122)]
    character_upper = [chr(i) for i in range(65,90)]

    lists = []
    lists.append(character_number)
    lists.append(character_symbol)
    lists.append(character_lower)
    lists.append(character_upper)

    password = []

    n = 5

    for i in range(n):
        for j in range(4):
            random_item = random.sample(lists[j],1)
            password.append(random_item)
      
    # password_str = ''.join(map(str,password))
    password_str = ''.join([i[0] for i in password])
    password_str = ''.join(random.sample(password_str,len(password_str)))
    return ("Your Password is: %s"%password_str)

generate_password()

# this block will ask users for proper input, being an email, else it will repeat until correct input is given
username = str(input("Your email is: "))
pattern = "[\w+\.-]+@[\w+]+\.[\w+]+"
 
while True:
    if re.findall(pattern, username):
        print(generate_password())
        break
    else:
        print("Please input a proper email address:")
        repeated_input = str(input("Your email is: "))
        username = repeated_input
        generate_password()