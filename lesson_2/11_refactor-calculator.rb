# REFACTORING THE CALCULATOR:

## In this file I will be refactoring the calculator app I did back in assignment 6.

## Things to think about (Before walkthrough):
=begin 
  1) Is there a better way to validate that the user has input a number? 
     We'll cover this in more detail in a future assignment.

     A => We could first create a method that validates if a user's input is a number.
          This would help separate concerns and make it easier to debug. Because this is an action we need
          to perform multiple times, it makes sense to make it a method.

          For the method itself...
          we can use the `input.to_i._to_s == input`
          This will check if the users input cleanly converts to a number and back to a string
          that is equvialent to the input. This is done because when you convert a string with no integers in it
          to an integer using `to_i` Ruby returns 0. If there is a number in the string, then it will return the
          first number it encounters.
          So the user inputs "1Hi"
          input.to_i => 1.to_s = "1"
          input == input.to_i.to_s?
          No. Therefore it's an invalid input.

          Something like this:
          def valid_num(input) 
            input == input.to_i.to_s ? true : false
          end 


  2) It looks like you can call to_i or to_f to convert strings to integers and floats, respectively. 
     Look up the String#to_i and String#to_f documentation in Ruby docs and look at their various examples and use cases.

          A => You can. In both cases if the first character is a non-number to_i & to_f return 0 or 0.0 respectively.
               to_i will return an Integer number up to the last number in the series of numbers, within a string.
               to_f will return a float up to the last number or up to a second decimal in the series of decimal numbers, within a string.


  3) Our operation_to_message method is a little dangerous, 
     because we're relying on the case statement being the last expression in the method. 
     What if we needed to add some code after the case statement within the method? 
     What changes would be needed to keep the method working with the rest of the program? 
     We'll show a solution in an upcoming assignment.
        
        A => Need to do the walkthrough first. I'll answer this afterwards.
     

  4) Most Rubyists don't invoke methods with parentheses, unless they're passing in an argument. 
     For example, we use name.empty?(), but most Rubyists would write name.empty?.
     Some Rubyists even go as far as not putting parentheses around method calls even when passing in arguments. 
     For example, they would write prompt "hi there" as opposed to prompt("hi there").
    
     Try removing some of the optional parentheses when calling methods
     to get your eyes acquainted with reading different styles of Ruby code. 
     This will be especially useful if you are using a DSL written in Ruby, like Rspec or Rails.

     A => Personally I always liked this style format.


  5) We're using Kernel.puts() and Kernel.gets(). But the Kernel. is extraneous as well as the parentheses. 
    Therefore, we can just call those methods by gets and puts.
    We already know that in Ruby we can omit the parentheses, but how come we can also omit the Kernel.?

    A => Maybe it's becasue the Kernel is a module not an object? The Kernel provides methods that can be used in a program
    but the methods aren't exactly specific to an object. Therefore we can just call them? Just a bad guess.


  6) There are lots of messages sprinkled throughout the program.
     Could we move them into some configuration file and access by key? 
     This would allow us to manage the messages much easier, and we could even internationalize the messages. 
     This is just a thought experiment, and no need to code this up.

     A => We could put these messages in a module and important this module into our main file. That way we can just call a 
          method that will display a message, and when we want to reuse that message we just have to use the method we made.
          Ontop of that, we can also make changes to the method itself as opposed to making changes to each time we've manually
          'puts'd the message.
=end

#<---------------------------------------------------------------------------------------------------->#
#                                         CALCUALTOR APP                                               #
#>----------------------------------------------------------------------------------------------------<#


def prompt(message)
  Kernel.puts("=> #{message}")
end 

def valid_number?(number)
  number.to_i() != 0
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

    if valid_number?(first_number)
      break
    else
      prompt("Please enter a valid number")
    end 
  end 

  second_number = nil 

  loop do
    prompt("What's your second number?")
    second_number = Kernel.gets().chomp()

    if valid_number?(second_number)
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

=begin 
  3) Our operation_to_message method is a little dangerous, 
     because we're relying on the case statement being the last expression in the method. 
     What if we needed to add some code after the case statement within the method? 
     What changes would be needed to keep the method working with the rest of the program? 
     We'll show a solution in an upcoming assignment.
        
        A => We could just use the case statements to assign the message to a varaible. Like this:

          def operation_to_message(op)
            op_message = ''
            case op
            when '1'
              op_message = 'Adding'
            when '2'
              op_message = 'Subtracting'
            when '3'
              op_message = 'Multiplying'
            when '4'
              op_message = 'Dividing'
            end 
            ...
          end 
=end