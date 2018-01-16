
MONTHS_IN_YEAR = 12

def prompt text
  puts "=> #{text}"
end

def valid_number? string
  valid_chars = %w(1 2 3 4 5 6 7 8 9 0 .)
  string.chars.each {|char| return false unless valid_chars.include? char }
  string.chars.count(".") <= 1 && !string.start_with?(".") && string.to_f >= 0
end

def ask_for text
  prompt text
  loop do
    input = gets.chomp.strip
    return input if valid_number? input
    prompt "Does not seem to be valid positive number. Please try again."
  end
end

puts
prompt "Welcome to mortgage calculator"

loop do
  loan_amount = ask_for "Please enter the loan amount (number only):"
  annual_perc_rate = ask_for "Please enter the Annual Percentage Rate (in %, number only):"
  duration_years = ask_for "Please enter the loan duration (in years, number only):"

  monthly_perc_rate = (annual_perc_rate.to_f / MONTHS_IN_YEAR / 100)
  duration_months = duration_years.to_f * MONTHS_IN_YEAR


  monthly_payment = loan_amount.to_f * (monthly_perc_rate /
   (1 - (1 + monthly_perc_rate)**(-duration_months)))

  puts "-------------------------------------"
  prompt "Your monthly payment is #{monthly_payment.round(2)}."
  puts "-------------------------------------"

  next_calculation = nil
  loop do
    prompt "Do you want to do another calculation? (y/n)"
    next_calculation = gets.chomp.strip
    break if next_calculation.downcase == "y" || next_calculation.downcase == "n"
    prompt "Please choose 'y' or 'n'"
  end
  break if next_calculation.downcase == "n"
end

prompt "Thank you for using our calculator!"