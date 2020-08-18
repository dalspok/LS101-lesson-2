def valid_number?(string)
  string.to_i.to_s == string
end

def valid_operation?(operation)
  [1, 2, 3, 4].include? operation
end

OPERATION_SYMBOL = { 1 => :+, 2 => :-, 3 => :*, 4 => :/ }

puts "What's your name?"
name = gets.chomp
puts "Welcome to calculator, #{name}"

loop do
  first, second = nil

  loop do
    puts "What is the first number?"
    first = gets.chomp
    break if valid_number?(first)
    puts "Sorry, it is not a valid number. Please, try again."
    puts
  end

  loop do
    puts "What is the second number?"
    second = gets.chomp
    break if valid_number?(second)
    puts "Sorry, it is not a valid number. Please, try again."
    puts
  end

  first = first.to_i
  second = second.to_i

  puts <<~MSG
          What operation do you want to perform?
            (1) Addition
            (2) Subtraction
            (3) Multiplication
            (4) Division"
          MSG

  operation = nil
  loop do
    operation = gets.chomp.to_i
    break if valid_operation?(operation)
    puts "Sorry, it is not a valid number. Please, choose between 1-4."
    puts
  end

  result = case operation
           when 1 then first + second
           when 2 then first - second
           when 3 then first * second
           when 4 then first.to_f / second
           end

  puts "#{first} #{OPERATION_SYMBOL[operation]} #{second} equals #{result}"

  puts "Do you want to perform another operation? (y/n)"
  continue = gets.chomp
  break if continue.downcase[0] == "n"
end

puts "Thank you for using calculator."
