# Mortgage/Load Calculator:

=begin 

  You'll need three pieces of information:
    • the loan amount
    • the Annual Percentage Rate (APR)
    • the loan duration

  From the above, you'll need to calculate the following things:
    • monthly interest rate
    • loan duration in months
    • monthly payment 

=end

def valid_number?(input)
  if input == input.to_f.to_s 
    return true
  elsif input == input.to_i.to_s 
    return true
  else 
    return false
  end 
end 

def get_monthly_payment(loan_amount, monthly_interest_rate, month_duration)
  monthly_payment = loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-month_duration)))
  return monthly_payment
end 

def apr_to_monthly_interest_rate(apr)
 return (apr.to_i / 12)
end 

puts "Welcome to the loan calculator!"

loop do # MAIN LOOP

  user_loan_amount = nil

  loop do 
    puts "Enter your loan amount :"
    user_loan_amount = gets.chomp

    if valid_number?(user_loan_amount)
      user_loan_amount.to_f.round(2)
      break
    else
      puts "Please input a valid number!"
    end 
  end 

  user_loan_duration = nil

  loop do 
    puts "Enter your loans duration (in years) :"
    user_loan_duration = gets.chomp

    if valid_number?(user_loan_duration)
      user_loan_duration.to_f.round(2)
      break
    else
      puts "Please input a valid number!"
    end     
  end 

  user_apr = nil 

  loop do
    puts "Enter your APR (annual percentage rate) :"
    user_apr = gets.chomp

    if valid_number?(user_apr)
      user_apr.to_f.round(2)
      break
    else
      puts "Please input a valid number!"
    end 
  end 
    # valid_number?(user_interest_rate)

  user_monthly_interest = (user_apr.to_f / 12) / 100 # (In decimal format)
  user_month_duration = user_loan_duration.to_f * 12

  monthly_payments = user_loan_amount.to_f * (user_monthly_interest / (1 - (1 + user_monthly_interest)**(-user_month_duration)))

  puts "• Total of #{user_month_duration.floor} payments"
  puts "• Monthly Payments of $#{monthly_payments.round(2)}"
  puts "• Monthly Interest rate is #{(user_monthly_interest * 100).round(2)}%"

  user_input = nil

  loop do
    puts "Would you like to perform another caluclation?\nType 'y' to continue or 'n' to exit/quit."
    user_input = gets.chomp.downcase

    if user_input == 'y' || user_input == 'n'
      break
    else
      puts "Please input a valid option!\nMust be 'y' (continue) or 'n' (exit/quit)."
    end
  end 

  break if user_input == 'n'
end