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

def valid_choice?(choice)
  choice.is_a?(String) && OPTIONS.include?(choice.downcase) 
end 

def get_computers_choice()
  # OPTIONS.pick_random_num(3)
end

def get_players_choice
  choice = nil
  loop do
    prompt("Choose one of the following options:")
    prompt("Rock • Paper • Scissors")
    choice = gets.chomp 
    break if valid_choice?(choice)
    prompt("ERROR: Please type a valid option!! \n")
  end
  puts " "
  choice.downcase 
end 

def player_continues?(answer)
  continue = nil
  loop do
    prompt("Would you like to play again? \nType 'y' (Yes) or 'n' (No)")
    does_player_continue = gets.chomp
    if CONTINUE_ANSWERS.include?(does_player_continue.downcase)
      continue = true
      break
    elsif EXIT_ANSWERS.include?(does_player_continue.downcase)
      continue = false
      break
    else
      prompt("ERROR: Please type a valid answer!!")
      puts " "
      continue = nil
      break
    end 
  end

  continue 
end

def evaluate_winner(players_choice, computers_choice)
  prompt("You played: #{players_choice}") 
  prompt("Computer played: #{computers_choice}")
  if (players_choice == 'rock' && computers_choice == 'scissors') || (players_choice == 'paper' && computers_choice == 'rock') || (players_choice == 'scissors' && computers_choice == 'paper')
    prompt("🥳 YOU WON!")
    puts " "
  elsif (players_choice == computers_choice)
    prompt("😑 TIE GAME!")
    puts " "
  else 
    prompt("🖥️  YOU LOST TO THE COMPUTER!")
    puts " "
  end 
end 

def play_round
  prompt("Welcome to Rock Paper Scissors!")
  puts " "

  round = 1 
  computer_score = 0
  player_score = 0

  loop do
    puts "--------------------------"
    puts "\tROUND #{round}"
    puts "--------------------------"
    puts " "

    players_choice = get_players_choice()
    # compuer_choice = get_computers_choice()
    computers_choice = 'paper'
    evaluate_winner(players_choice, computers_choice)

    prompt("Would you like to play again?")
    prompt("Type 'y' (Yes) or 'n' (No)")
    does_player_continue = gets.chomp
    puts " "

    if does_player_continue == 'n' || does_player_continue == 'no'
      prompt("Thank you for playing. Goodbye!")
      break
    end 

    round += 1
  end 
end 

play_round()





