def prompt(message)
  Kernel.puts("=> #{message}")
end 

def integer?(num)
  num == num.to_i.to_s ? true : false
end 

def float?(num)
  num == num.to_f.to_s ? true : false
end

def number?(num)
  ( float?(num) || integer?(num) ) ? true : false
end 

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end 
end 
  
name = ''

prompt("What's you name?")

loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure to enter a valid name.")
  else 
    break
  end 
end 

prompt("Hi #{name}!")

loop do # main loop
  first_number = nil 

  loop do
    prompt("What's your first number?")
    first_number = Kernel.gets().chomp()

    if integer?(first_number)
      break
    else
      prompt("Please enter a valid number")
    end 
  end 

  second_number = nil 

  loop do
    prompt("What's your second number?")
    second_number = Kernel.gets().chomp()

    if integer?(second_number)
      break
    else
      prompt("Please enter a valid number")
    end 
  end 

  operator = nil 

  prompt( "What operation would you like to perform?\n1) add \n2) subtract \n3) multiply \n4) divide" )

  loop do 
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else 
      prompt("Please choose numbers 1, 2, 3 or 4.")
    end 
  end 

  result = case operator
          when '1'
            first_number.to_i() + second_number.to_i()
          when '2'
           first_number.to_i() - second_number.to_i()
          when '3'
           first_number.to_i() * second_number.to_i()
          when '4'
           first_number.to_f() / second_number.to_f()
  end 

  prompt("#{operation_to_message(operator)} the two numbers equals #{result.to_s}")

  prompt("Do you want to perform another calculation?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end 

prompt("Thank you for using this calculator. Goodbye.")

# FEATURES TO ADD:

=begin 
1. Better integer validation. ✅

  The current method of validating the input for a number is very weak. 
  It's also not fully accurate, as you cannot enter a 0. 
  Come up with a better way of validating input for integers.

2. Number validation.

  Suppose we're building a scientific calculator, 
  and we now need to account for inputs that include decimals. 
  How can we build a validating method, called `number?``,
  to verify that only valid numbers -- integers or floats -- are entered?

3. Our operation_to_message method is a little dangerous,
  since we're relying on the case statement being the last expression in the method.
  Suppose we needed to add some code after the case statement within the method? 
  What changes would be needed to keep the method working with the rest of the program?

4. Extracting messages in the program to a configuration file.

  There are lots of messages sprinkled throughout the program. 
  Could we move them into some configuration file and access by key? 
  This would allow us to manage the messages much easier, and we could even internationalize the messages.

5. Your calculator program is a hit, and it's being used all over the world! 
  Problem is, not everyone speaks English. You need to now internationalize the messages in your calculator. 
  You've already done the hard work of extracting all the messages to a configuration file. 
  Now, all you have to do is send that configuration file to translators and call the right translation in your code.

=end

# ✅ = Complete