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

#play_round()

puts("----------------------------------------")
puts("----------------------------------------")
puts("----------------------------------------")

#---------------------------------------------#
#---------------> WALK-THROUGH <---------------#
#---------------------------------------------#

=begin
  'wt' will be used for any duplicate methods from my 
  version of the game to distinguish between the two games.
=end

Kernel.puts("Welcome to LS's 'Rock. Paper, Scissors'!")

VALID_CHOICES =  ["rock", "paper", "scissors"]

def prompt_wt(message)
  Kernel.puts "=> #{message}"
end

def display_results(player, computer)
  if player == 'rock' && computer == 'scissors'  ||
    player == 'scissors' && computer == 'paper' ||
    player == 'paper' && computer == 'rock'
    prompt_wt("You won!")
  elsif player == 'rock' && computer == 'paper'  ||
    player == 'scissors' && computer == 'rock' ||
    player == 'paper' && computer == 'scissors' 
    prompt_wt("You lost.")
  else
    prompt_wt("It's a tie.")
  end 
end 

loop do
  choice = ''

  loop do
    prompt_wt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else 
      prompt_wt("That's not a valid choice.")
    end 
  end 

  computer_choice = VALID_CHOICES.sample()
  
  prompt_wt("You chose: #{choice}; Computer chose: #{computer_choice};")

  display_results(choice, computer_choice)

  prompt_wt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt_wt("Thank you for playing. Goodbye!")

=begin  
  Here are some things to consider from the assignment:

  1) Notice how the display_results method calls the prompt method. 
  What happens if you move the display_results method definition above the prompt method definition?
  Does it still work?

      A => Before I try: I believe it won't work because we're calling a method that hasb't been defined yet in our
      program, because Ruby processes from top to bottom.
      
      After trying: Turns out it still works. This leads me to beleive that for methods Ruby doesn't necessarily evaluate 
      from top to bottom in the code.

  2) Create another method called test_method at the very top, before the prompt method definition.
  Now try invoking the newly created method from just after the prompt method definition. 
  Does it work? Now try invoking the method again just before the prompt method definition. 
  Does it work? Why is there a different result?

  Should look like this:
  ------------------------------------------------------------
    def test_method
      prompt('test message')
    end

    test_method  # 2nd, try invoking "test_method" here

    def prompt(message)
      Kernel.puts("=> #{message}")
    end
                                                                  
    test_method           # 1st, try invoking "test_method" here
  ------------------------------------------------------------

    A => Before trying: I think this will produce an error on the 2nd call. I think this because I intuitively
    believe that Ruby will work this way, despite seeing what the last test question resulted in.

    After trying: Turns out I was correct. I get an error message on the second call that reads:
    ------------------------------------------------------------
      21_rock-paper-scissors-walkthrough.rb:181:in `test_method': undefined method `prompt_wt' for main:Object (NoMethodError)

      prompt_wt('test message')
      ^^^^^^^^^
      Did you mean?  prompt
      from 21_rock-paper-scissors-walkthrough.rb:183:in `<main>'
    ------------------------------------------------------------
    
    This leads me to think that Ruby is evaluated from top to bottom when running a program. 
    But if this is the case, then how come methods can be defined out of sequence and still read eachother?
    Methods can be defined out of sequence, but calling methods before they've been defined is not possible.
    It's as if everything after a method call, in the code, doesn't exist.
    The code does execute from top-to-bottom, but the method definitions themselves do not execute until they are called.

  3) How would you use the display_results method differently if it returned a string, 
  as opposed to outputting the string directly?

    A => If the display_results method didn't output to the terminal I would name it something different like:
    `get_round_outcome` but secondly, in this case it would be returning a string, so I would just do `prompt(display_results)`
    as opposed to just simply called `display_results`. Because now we have to output the return ourselves from the method,
    the method doesn't do that for us.

  4) Running Rubocop on this code generates a lot of complaints about the display_results method being too complex. 
  Can you think of a way to mitigate? 
  We'll tackle this in an upcoming assignment, but try to think about a possible solution.

    A => I would store the winning combinations in a constant variable as an array; 0th index being the player's choice
    and the 1st index being the computer's choice. Then I would create an if/else in  `display_results` that would check to
    see if the pairing of the player and computer's resutls in an array matched any of the arrays in the constant.

    Not to mention, I would just do `elsif player == computer` to evaluate a tie and then use an `else` statement to display
    the losing results, as we've already evaluated the winning condition and the tie game condition. This also saves us from
    writing out a constant for LOSING_COMBOS.

    How I would do it:
    ------------------------------------------------------------
    WINNING_COMBOS = [ ['rock', 'scissors'], ['scissors', 'paper'], ['paper', 'rock'] ]

    def display_results(player, computer)
      if WINNING_COMBOS.include?([player, computer])
        puts "You Win!"
      elsif player == computer
        puts "Tie Game.!"
      else
        puts "You Lose!"
      end 
    end 
    ------------------------------------------------------------
=end
