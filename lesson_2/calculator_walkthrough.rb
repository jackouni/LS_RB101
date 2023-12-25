## ASSIGNMENT: 
# Walk-through: Calculator

=begin 
  Build a command line calculator program that does the following:

    1) asks for two numbers
    2) asks for the type of operation to perform: add, subtract, multiply or divide
    3) displays the result 

  Use the Kernel.gets() method to retrieve user input, and use Kernel.puts() method to display output.
  Remember that Kernel.gets() includes the newline, 
  so you have to call chomp() to remove it: Kernel.gets().chomp() 
=end

# >---------------------------------------------------------------------------------------------------< #
# <----------------------------------------------------------------------------------------------------> #

## MY CALCULATOR ATTEMPT:
# Decided to try and build the calculator myself before following the walkthrough.

def valid_num?(num)
  true if num.to_i.to_s == num
end 

def valid_operator?(operator)
  valid_operations = ["*", "+", "-", "/"]
  true if valid_operations.include?(operator)
end

def display_help 
  Kernel.puts("These operators are valid to enter:       
    '*' ~ Mutliply \n 
    '/' ~ Divide \n 
    '+' ~ Add \n 
    '-' ~ Subtract \n 
    Ctl + C ~ exit program \n ")
end 

def calculate(num_1, operator, num_2) 
  case operator
  when '+' then num_1 + num_2
  when '-' then num_1 - num_2
  when '*' then num_1 * num_2
  when '/' then num_1 / num_2
  else "ERROR"
  end
end  

def calculator() 
  Kernel.puts("WELCOME TO THE CALCULCATOR APP - (( MY VERSION ))")
  Kernel.puts("Type in a calculation you want to make...")
  Kernel.puts("At any time if you need a cheat sheet, just type: \"help\" or \"h\"." )

  loop do
    num_1 = nil
    operator = nil
    num_2 = nil

    # Get first number in expression
    loop do  
      Kernel.puts("Enter the first Integer number in your expression.")
      first_num = Kernel.gets().chomp()

      if first_num == 'h' || first_num == 'help'
        display_help()
        next
      end

      if valid_num?(first_num)
        num_1 = first_num.to_i
        break
      end

      Kernel.puts("Please enter a valid whole number (no decimals)" )
    end

    # Get operator
    loop do 
      Kernel.puts( "Enter the operation you want to perform: \n
            '*' ~ Mutliply \n 
            '/' ~ Divide \n 
            '+' ~ Add \n 
            '-' ~ Subtract \n ")

      user_operator = Kernel.gets().chomp()

      if user_operator == 'h' || user_operator == 'help'
        display_help()
        next
      end

      if valid_operator?(user_operator)
        operator = user_operator
        break
      end

      Kernel.puts("Please enter a valid operator!" )
    end

    # Get second number in expression
    loop do  
      Kernel.puts("Enter the second Integer number in your expression.")
      second_num = Kernel.gets().chomp()

      if second_num.downcase == 'h' || second_num.downcase == 'help'
        display_help()
        next
      end

      if valid_num?(second_num)
        num_2 = second_num.to_i()
        break
      end

      Kernel.puts( "Please enter a valid whole number (no decimals)" )
    end

    Kernel.puts("#{num_1} #{operator} #{num_2} is equal to #{calculate(num_1, operator, num_2)}")

    Kernel.puts("Want to perform another operation?\nType 'q' or 'quit' to exit program:")
    user_continue = Kernel.gets().chomp()

    break if user_continue.downcase() == 'q' || user_continue.downcase() == 'quit'
  end  
end

calculator()

# >---------------------------------------------------------------------------------------------------< #
# <---------------------------------------------------------------------------------------------------> #


## CALCULATOR WALK-THROUGH:
# Following the walkthrough.

# Ask user for two numbers
# Ask user for operation to perform
# Perform the operation on the two numbers
# output the results


Kernel.puts("Welcome to the calculator app - (( LAUNCH SCHOOL ))")
Kernel.puts("What's your first number?")
first_number = Kernel.gets()

# Note: 
  # '#inspect' shows you escape and hidden characters, that 'puts' abstracts away.
  puts("Inspecting 'gets': #{first_number.inspect()}") # A new-line character ( \n ) is added in our 'gets'.
  # '#chomp' returns a string of self without new-line characters.
  puts("With 'chomp': #{first_number.chomp()}") # The string is returned without the new line character.
  puts("")

  first_number = first_number.chomp() # Applying the 'CHOMP' to first_number
#

Kernel.puts("What's your second number?")
second_number = Kernel.gets().chomp()

Kernel.puts("What operation would you like to perform? 
  1) add 2) subtract 3) multiply 4) divide")
operator = Kernel.gets().chomp()

if operator == '1'
  results = first_number + second_number
  Kernel.puts("'result' with String concat: #{results}")
  # ⬆️ 'results outputs a string concatenation. 
  
  # ⬇️ We have to use 'to_i' to convert our string inputs into Integers, so ruby can perform arithmetic on them.
  results = first_number.to_i + second_number.to_i
  Kernel.puts("'result' with Integers: #{results}")

elsif operator == '2'
  results = first_number.to_i - second_number.to_i
  Kernel.puts(results)

elsif operator == '3'
  results = first_number.to_i * second_number.to_i
  Kernel.puts(results)

elsif operator == '4'
  results = first_number.to_i / second_number.to_i
  Kernel.puts("'result' with Integers: #{results}")
  # ⬆️ The results for division won't print out decimal vales.
  # This is because Ruby is doing whole Integer divison.

  # ⬇️ To display floats we need to apply the 'to_f' to our numbers.
  results = first_number.to_f / second_number.to_f
  Kernel.puts("'result' with Floats: #{results}")
end 

Kernel.puts("--------------------")
Kernel.puts("--------------------")





