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

def loan_with_interest( loan_amount, monthly_interest_rate )
  total_payments = loan_amount + ((loan_amount * monthly_interest_rate) / 100)
  total_payments
end

def get_monthly_payment( overall_amount_owed, month_duration)
  overall_amount_owed / month_duration
end 

def convert_year_to_month( year_duration )
  month_duration = year_duration.to_f * 12.00
  month_duration.round(2)
end 

def convert_apr_to_monthly_rate(apr)
  monthly = apr.to_f / 12
  monthly.round(2)
end

puts "Welcome to the loan calculator!"
puts "Enter your loan amount :"
user_loan_amount = gets.chomp

# valid_number?(user_loan)

puts "Enter your loans duration (in years) :"
user_loan_duration = gets.chomp

# valid_duration?(user_loan_duration)

puts "Enter your APR (annual interest rate) :"
user_apr = gets.chomp

# valid_number?(user_interest_rate)

user_overall_amount_owing = loan_with_interest(user_loan_amount.to_f, user_apr.to_f).round(2)
user_monthly_percentage_rate = convert_apr_to_monthly_rate(user_apr.to_f).round(2)
user_month_duration = convert_year_to_month(user_loan_duration.to_f).round(2)
user_monthly_payments = get_monthly_payment(user_overall_amount_owing, user_month_duration).round(2)

puts "• Overall owing amount (Loan + Interest) = $#{user_overall_amount_owing}"
puts "• Loan duration = #{user_month_duration} months"
puts "• Monthly interst rate = #{user_monthly_percentage_rate}%"
puts "• Monthly payment amount = $#{user_monthly_payments} per month"
