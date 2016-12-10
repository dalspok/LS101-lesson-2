
def valid_number?(num)
  num.to_f.to_s == num || num.to_i.to_s == num
end

def get_data(text)
  loop do
    print text
    input = gets.chomp.strip
    return input.to_f if valid_number?(input) && input.to_f >= 0
    puts "Please enter non-negative number."
  end
end

puts "\nWelcome to mortgage calculator\n\n"

loop do
  # input
  amount = get_data("Loan amount: ")
  perc_year = get_data("Percentage (per year, in %): ")
  dur_years = get_data("Duration (years): ")

  # calculation
  dur_months = dur_years * 12
  perc_month = (perc_year / 100.0) / 12.0
  payment = amount * (perc_month / (1 - (1 + perc_month)**-dur_months))

  puts "-------------------------------------------"
  puts "Your monthly payment is #{payment.round(2)}"
  puts "-------------------------------------------"

  # another?
  print "Another calucation? (y/n): "
  break unless gets.chomp.strip.downcase.start_with?("y")
end

puts "Thank you for using our calculator."
