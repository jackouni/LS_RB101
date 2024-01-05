=begin 
  Like the last walkthrough assignment, assignment 6, I'm going to start by trying to create my own 
  Rock Paper Scissors Game first (top section of this file) and then do the walkthrough after (bottom section of this file) 
  to compare what I came up with, with the walkthrough.  
=end

=begin 
  In this assignment, we'll build a Rock Paper Scissors game. The game flow
  should go like this:
    • the user makes a choice
    • the computer makes a choice
    • the winner is displayed
=end

#---------------------------------------------#
#---------------> MY ATTEMPT <----------------#
#---------------------------------------------#

OPTIONS = ['rock', 'paper', 'scissors']
CONTINUE_ANSWERS = ['y','yes']
EXIT_ANSWERS = ['n', 'no']

def prompt(message)
  puts "=> #{message}"
end

def display_scores(player_score, computer_score)
  prompt("SCORES:")
  prompt("You => #{player_score}")
  prompt("Computer => #{computer_score}")
  puts " "
end

def display_round_number(round)
  puts "--------------------------"
  puts "\tROUND #{round}"
  puts "--------------------------"
  puts " "
end 

def display_choices(players_choice, computers_choice)
  prompt("You played: #{players_choice}") 
  prompt("Computer played: #{computers_choice}")
end 

def is_random_choice?(choice)
  choice.downcase == 'random'
end 

def get_random_choice
  OPTIONS.sample()
end 

def valid_choice?(choice)
  OPTIONS.include?(choice.downcase) 
end 

def valid_answer?(answer)
  CONTINUE_ANSWERS.include?(answer.downcase) || EXIT_ANSWERS.include?(answer.downcase)
end 

def get_computers_choice()
  OPTIONS.sample()
end

def get_players_choice
  choice = nil
  loop do
    prompt("Choose one of the following options:")
    prompt("Rock • Paper • Scissors • Random")
    choice = gets.chomp 

    if is_random_choice?(choice)
      choice = get_random_choice() 
    end 
    break if valid_choice?(choice)

    prompt("ERROR: Please type a valid option!! \n")
  end
  puts " " 
  choice.downcase 
end 

def player_discontinues?
  player_continues = nil
  loop do
    prompt("Would you like to play again?")
    prompt("Type 'y' (Yes) or 'n' (No)")
    answer = gets.chomp

    if valid_answer?(answer)
      if CONTINUE_ANSWERS.include?(answer.downcase)
        player_continues = false
        break
      else
        player_continues = true
        break
      end
    else
      prompt("ERROR: Please enter a valid answer!!")
    end 
  end

  player_continues 

end

def evaluate_winner(players_choice, computers_choice)

  display_choices(players_choice, computers_choice)
  winner = 'tie'

  if (players_choice == 'rock' && computers_choice == 'scissors') || (players_choice == 'paper' && computers_choice == 'rock') || (players_choice == 'scissors' && computers_choice == 'paper')
    prompt("🥳 YOU WON!")
    puts " "
    winner = 'player'
  elsif (players_choice == computers_choice)
    prompt("😑 TIE GAME!")
    puts " "
  else 
    prompt("🖥️  YOU LOST TO THE COMPUTER!")
    puts " "
    winner = 'computer'
  end 
  
  winner

end 

def play_round
  prompt("Welcome to Rock Paper Scissors!")
  puts " "

  round = 1 
  computer_score = 0
  player_score = 0

  loop do
    display_round_number(round)

    players_choice = get_players_choice()
    computers_choice = get_computers_choice()
    winner = evaluate_winner(players_choice, computers_choice)

    case winner
    when 'player'
      player_score += 1
    when 'computer'
      computer_score += 1
    end
    
    display_scores(player_score, computer_score)

    break if player_discontinues?()

    round += 1

  end 
end 

play_round()

#---------------------------------------------#
#---------------> WALK-THROUGH <---------------#
#---------------------------------------------#

