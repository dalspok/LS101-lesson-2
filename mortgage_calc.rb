
def get_data(text)
  loop do
    print text
    input = gets.chomp.to_f
    return input if input >= 0
    puts "Please enter number only, greater than zero. "
  end
end

puts "Welcome to mortgage calculator"

loop do
  amount = get_data("Loan amount: ")
  perc_year = get_data("Percentage (per year, in %): ")
  dur_years = get_data("Duration (years): ")

  dur_months = dur_years * 12
  perc_month = (perc_year / 100.0) / 12.0
  payment = amount * (perc_month / (1 - (1 + perc_month)**-dur_months))

  puts "-------------------------------------------"
  puts "Your monthly payment is #{payment.round(2)}"
  puts "-------------------------------------------"
  
  print "Another calucation? (y/n): "
  break if gets.chomp.downcase.start_with?("n")
end