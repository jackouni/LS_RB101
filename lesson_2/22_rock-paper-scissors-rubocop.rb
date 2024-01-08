Kernel.puts("Welcome to LS's 'Rock. Paper, Scissors, Lizard, Spock'!")

ALIASES = %w(r p sc l sp)
VALID_CHOICES = %w(rock paper scissors lizard spock)

WIN_COMBOS = [['rock', 'scissors'], ['scissors', 'paper'], ['paper', 'rock'], ['rock', 'lizard'], ['lizard', 'spock'], ['spock', 'scissors'], ['scissors', 'lizard'], ['lizard', 'paper'], ['paper', 'spock'], ['spock', 'rock']]

def prompt(message)
  Kernel.puts "=> #{message}"
end

def win?(first, second)
  WIN_COMBOS.include?([first, second])
end

def alias_to_full_word(choice)
  alias_index = ALIASES.index(choice)
  VALID_CHOICES[alias_index]
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
    prompt("Choose one: #{VALID_CHOICES.join(', ')}\n( You can also type 'r', 'p', 'sc', 'l' or 'sp' for short. )")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    elsif ALIASES.include?(choice)
      choice = alias_to_full_word(choice)
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
