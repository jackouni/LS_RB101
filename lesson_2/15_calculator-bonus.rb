def prompt(message)
  Kernel.puts("=> #{message}")
end 

def valid_number?(number)
  number == number.to_i.to_s ? true : false
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