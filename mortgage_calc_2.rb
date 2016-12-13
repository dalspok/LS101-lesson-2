
def valid_number?(num)
  num.to_f.to_s == num || num.to_i.to_s == num
end

def get_data(text)
  loop do
    print text
    input = gets.chomp.strip
    return input.to_f if valid_number?(input) && input.to_f > 0
    puts "Please enter positive number."
  end
end

puts "\nWelcome to mortgage calculator\n\n"

loop do
  # input
  amount = get_data("Loan amount: ")
  percentage_years = get_data("Percentage (per year, in %): ")
  duration_years = get_data("Duration (years): ")

  # calculation
  duration_months = duration_years * 12
  percentage_month = (percentage_years / 100.0) / 12.0
  payment = amount * (percentage_month / (1 - (1 + percentage_month)** -duration_months))

  puts "-------------------------------------------"
  puts "Your monthly payment is #{payment.round(2)}"
  puts "-------------------------------------------"

  # another?
  another_calculation = nil
  loop do
    print "Another calculation? (y/n): "
    another_calculation = gets.chomp.strip.downcase
    break if another_calculation.start_with?("y") || another_calculation.start_with?("n")
    puts "Please choose 'y' or 'n'"
  end
  break if another_calculation.start_with?("n")
end

puts "Thank you for using our calculator."
