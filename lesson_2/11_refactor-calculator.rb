# REFACTORING THE CALCULATOR:

## In this file I will be refactoring the calculator app I did back in assignment 6.

## Things to think about:
=begin 
  1) Is there a better way to validate that the user has input a number? 
     We'll cover this in more detail in a future assignment.

  2) It looks like you can call to_i or to_f to convert strings to integers and floats, respectively. 
     Look up the String#to_i and String#to_f documentation in Ruby docs and look at their various examples and use cases.

  3) Our operation_to_message method is a little dangerous, 
     because we're relying on the case statement being the last expression in the method. 
     What if we needed to add some code after the case statement within the method? 
     What changes would be needed to keep the method working with the rest of the program? 
     We'll show a solution in an upcoming assignment.

  4) Most Rubyists don't invoke methods with parentheses, unless they're passing in an argument. 
     For example, we use name.empty?(), but most Rubyists would write name.empty?.
     Some Rubyists even go as far as not putting parentheses around method calls even when passing in arguments. 
     For example, they would write prompt "hi there" as opposed to prompt("hi there").
    
     Try removing some of the optional parentheses when calling methods
     to get your eyes acquainted with reading different styles of Ruby code. 
     This will be especially useful if you are using a DSL written in Ruby, like Rspec or Rails.

  5) We're using Kernel.puts() and Kernel.gets(). But the Kernel. is extraneous as well as the parentheses. 
     Therefore, we can just call those methods by gets and puts.
    We already know that in Ruby we can omit the parentheses, but how come we can also omit the Kernel.?

  6) There are lots of messages sprinkled throughout the program.
     Could we move them into some configuration file and access by key? 
     This would allow us to manage the messages much easier, and we could even internationalize the messages. 
     This is just a thought experiment, and no need to code this up.
=end

#<---------------------------------------------------------------------------------------------------->#
#                                         CALCUALTOR APP                                               #
#>----------------------------------------------------------------------------------------------------<#

Kernel.puts("Welcome to the calculator app - (( LAUNCH SCHOOL ))")
Kernel.puts("What's your first number?")
first_number = Kernel.gets()

  puts("Inspecting 'gets': #{first_number.inspect()}")
  puts("With 'chomp': #{first_number.chomp()}")

  first_number = first_number.chomp()


Kernel.puts("What's your second number?")
second_number = Kernel.gets().chomp()

Kernel.puts("What operation would you like to perform? 
  1) add 2) subtract 3) multiply 4) divide")
operator = Kernel.gets().chomp()

if operator == '1'
  results = first_number + second_number
  Kernel.puts("'result' with String concat: #{results}")
  
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

  results = first_number.to_f / second_number.to_f
  Kernel.puts("'result' with Floats: #{results}")
end 