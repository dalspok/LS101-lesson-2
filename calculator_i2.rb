def prompt(message)
  puts ">> #{message}"
end

def valid_number(number)
  number.to_i.to_s == number
end

def operation_to_msg(operation)
  case operation
  when 1
    "Adding"
  when 2
    "Subtracting"
  when 3
    "Multiplying"
  when 4
    "Dividing"
  end
end

prompt "Welcome to calculator"

loop do
  number1, number2, operation = nil

  loop do
    prompt "What's the first number?"
    number1 = gets.chomp
    break if valid_number(number1)
    prompt "Please, enter valid_number"
  end

  loop do
    prompt "What's the second number?"
    number2 = gets.chomp
    break if valid_number(number2)
    prompt "Please, enter valid_number"
  end

  prompt <<-Q
    What operation?
    1)add
    2)subtract
    3)multiply
    4)divide
  Q

  loop do
    operation = gets.chomp.to_i
    break if [1, 2, 3, 4].include?(operation)
    prompt "Please enter valid operation"
  end

  prompt "#{operation_to_msg(operation)} numbers..."

  result = case operation
           when 1
             number1.to_i + number2.to_i
           when 2
             number1.to_i - number2.to_i
           when 3
             number1.to_i * number2.to_i
           when 4
             number1.to_i / number2.to_i.to_f
           end

  puts "Result is #{result}"
  prompt "Do you want to continue? (y-yes)"
  continue = gets.chomp
  break if continue != "y"
end

puts "Thank you for using calculator"
