Kernel.puts("Welcome to LS's 'Rock. Paper, Scissors'!")

VALID_CHOICES = %w(rock paper scissors)

WIN_COMBOS = [['rock', 'scissors'], ['scissors', 'paper'], ['paper', 'rock']]

def prompt(message)
  Kernel.puts "=> #{message}"
end

def win?(first, second)
  WIN_COMBOS.include?([first, second])
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
