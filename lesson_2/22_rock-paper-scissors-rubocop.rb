Kernel.puts("Welcome to LS's 'Rock. Paper, Scissors, Lizard, Spock'!")

ALIASES = %w(r p sc l sp)
VALID_CHOICES = %w(rock paper scissors lizard spock)

WIN_COMBOS = [['rock', 'scissors'],
              ['scissors', 'paper'],
              ['paper', 'rock'],
              ['rock', 'lizard'],
              ['lizard', 'spock'],
              ['spock', 'scissors'],
              ['scissors', 'lizard'],
              ['lizard', 'paper'],
              ['paper', 'spock'],
              ['spock', 'rock']]

def prompt(message)
  Kernel.puts "=> #{message}"
end

def get_winner(player_choice, computer_choice)
  if player_choice == computer_choice
    "tie"
  elsif WIN_COMBOS.include?([player_choice, computer_choice])
    "player"
  else
    "computer"
  end
end

def alias_to_full_word(choice)
  alias_index = ALIASES.index(choice)
  VALID_CHOICES[alias_index]
end

def display_results(winner)
  if winner == 'player'
    prompt("You Win!")
  elsif winner == 'computer'
    prompt("You Lost!")
  else
    prompt("It's a tie.")
  end
end

def display_scores(player_score, computer_score)
  prompt("Player Score: #{player_score}; Computer Score: #{computer_score};")
end

player_score = 0
computer_score = 0

loop do
  player_choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}
    You can also type: #{ALIASES.join(', ')}.")
    player_choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(player_choice)
      break
    elsif ALIASES.include?(player_choice)
      player_choice = alias_to_full_word(player_choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample()

  winner = get_winner(player_choice, computer_choice)

  case winner
  when 'player'
    player_score += 1
  when 'computer'
    computer_score += 1
  end

  prompt("You chose: #{player_choice}; Computer chose: #{computer_choice};")
  display_results(winner)
  display_scores(player_score, computer_score)

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Goodbye!")
