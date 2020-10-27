def prompt(message)
  puts "==> #{message}"
end

def valid?(num)
  num.to_i.to_s == num
end

def operation_to_text(operation)
  case operation
  when 1 then "Adding"
  when 2 then "Subtracting"
  when 3 then "Multiplying"
  when 4 then "Dividing"
  end
end

prompt "Welcome to calculator"

loop do
  num1, num2, operation = nil

  loop do
    prompt "What is the first number?"
    num1 = gets.chomp
    break if valid? num1
    prompt "Sorry, this is not a valid number"
  end

  loop do
    prompt "What is the second number?"
    num2 = gets.chomp
    break if valid? num2
    prompt "Sorry, this is not a valid number"
  end

  loop do
    prompt <<~MSG
     What operation do you want to perform?:
     1) Addition
     2) Subtraction
     3) Multiplication
     4) Division
    MSG

    operation = gets.chomp.to_i
    break if [1, 2, 3, 4].include? operation
    prompt "Sorry, this is not a valid operation number"
  end

  result = case operation
           when 1 then num1.to_i + num2.to_i
           when 2 then num1.to_i - num2.to_i
           when 3 then num1.to_i * num2.to_i
           when 4 then num1.to_f / num2.to_i
           end

  puts "#{operation_to_text(operation)} #{num1} and #{num2}"
  puts "Result is #{result}"
  puts
  puts "Do you want to perform another operation? (Y/N)"
  break if gets.chomp.downcase.start_with? "n"
end

puts "Thank you for using calculator"
