=begin 
  Build a command line calculator program that does the following:

    1) asks for two numbers
    2) asks for the type of operation to perform: add, subtract, multiply or divide
    3) displays the result 

  Use the Kernel.gets() method to retrieve user input, and use Kernel.puts() method to display output.
  Remember that Kernel.gets() includes the newline, 
  so you have to call chomp() to remove it: Kernel.gets().chomp() 
=end

def valid_num?(num)
  true if num.to_i.to_s == num
end 

def valid_operator?(operator)
  valid_operations = ["*", "+", "-", "/"]
  true if valid_operations.include?(operator)
end

def display_help 
  puts "These operators are valid to enter:       
        '*' ~ Mutliply \n 
        '/' ~ Divide \n 
        '+' ~ Add \n 
        '-' ~ Subtract \n "
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
  puts "Type in a calculation you want to make..."
  puts "At any time if you need a cheat sheet, just type: \"help\" or \"h\"." 

  num_1 = nil
  operator = nil
  num_2 = nil

  # Get first number in expression
  loop do  
    puts "Enter the first Integer number in your expression."
    first_num = Kernel.gets().chomp()

    if first_num == 'h' || first_num == 'help'
      display_help()
      next
    end

    if valid_num?(first_num)
      num_1 = first_num.to_i
      break
    end

    puts "Please enter a valid whole number (no decimals)" 
  end

  # Get operator
  loop do 
    puts "Enter the operation you want to perform: \n
          '*' ~ Mutliply \n 
          '/' ~ Divide \n 
          '+' ~ Add \n 
          '-' ~ Subtract \n "

    user_operator = Kernel.gets().chomp()

    if user_operator == 'h' || user_operator == 'help'
      display_help()
      next
    end

    if valid_operator?(user_operator)
      operator = user_operator
      break
    end

    puts "Please enter a valid operator!" 
  end

  # Get second number in expression
  loop do  
    puts "Enter the second Integer number in your expression."
    second_num = Kernel.gets().chomp()

    if second_num == 'h' || second_num == 'help'
      display_help()
      next
    end

    if valid_num?(second_num)
      num_2 = second_num.to_i
      break
    end

    puts "Please enter a valid whole number (no decimals)" 
  end

  puts "#{num_1} #{operator} #{num_2} is equal to #{calculate(num_1, operator, num_2)}"
end

calculator()