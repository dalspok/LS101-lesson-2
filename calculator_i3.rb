
OPERATORS = {"1" => :+, "2" => :-, "3" => :*, "4" => :/}

def valid_number?(number)
  number.to_i.to_s == number || number.to_f.to_s == number
end

def acquire_number
  loop do
    num = gets.chomp
    return num.to_f if valid_number?(num)
    puts "Sorry, it is not a valid number. Try again."
  end
end

def acquire_operator
  puts "What operation do you want to make?"
  puts "1) Addition"
  puts "2) Subtraction"
  puts "3) Multiplication"
  puts "4) Division"

  loop do
    operation = gets.chomp
    return operation if %w(1 2 3 4).include? operation
    puts "Sorry, it is not a valid operation. Try again."
  end
end

def continue?
  input = nil
  loop do
    puts "Do you want to continue? (y/n)"
    input = gets.chomp
    break if %w(y n).include? input.downcase
    puts "Sorry, not a valid choice."
  end
  input.downcase == "y"
end

# Main program

puts "Welcome to calculator"

loop do
  first_num, second_num = nil
  puts "Enter first number:"
  first_num = acquire_number
  puts "Enter second number:"
  second_num = acquire_number
  operation = acquire_operator

  if second_num == 0 && operation == "4"
    puts "Sorry, you can not divide by 0"
  else
    second_num = second_num.to_f if operation == "4"
    result = [first_num, second_num].reduce(OPERATORS[operation])
    puts "#{first_num} #{OPERATORS[operation]} #{second_num} = #{result}"
  end

  break unless continue?
end

puts "Thank you"
