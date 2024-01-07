Kernel.puts("Welcome to LS's 'Rock. Paper, Scissors'!")

VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  Kernel.puts "=> #{message}"
end

def win?(first, second)
  if (first == 'rock' && second == 'scissors')  ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'paper' && second == 'rock')
    true 
  else
    false
  end 
end 

def display_results(player, computer)
  if win?(player, computer)
    prompt("You Win!")
  elsif win?(computer, player)
    prompt("You Lost!")
  else
    prompt("It's a tie.")
  end 
end 

loop do
  choice = ''

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else 
      prompt("That's not a valid choice.")
    end 
  end 

  computer_choice = VALID_CHOICES.sample()
  
  prompt("You chose: #{choice}; Computer chose: #{computer_choice};")

  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Goodbye!")
