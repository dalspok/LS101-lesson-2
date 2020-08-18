
def prompt(message)
  puts "==> #{message}"
end

def valid_number?(num)
  num.to_i != 0 || num == "0"
end

def valid_operation?(operation)
  %w(1 2 3 4).include? operation
end

def operation_to_message(operation)
  case operation
  when "1"
    "Adding"
  when "2"
    "Subtracting"
  when "3"
    "Multiplying"
  when "4"
    "Dividing"
  end
end

puts
prompt "Welcome to calculator."

loop do # main loop
  first = ""
  loop do
    prompt "What is first number?"
    first = gets.chomp
    break if valid_number?(first)
    prompt "It doesn't seem to be a valid number. Please try again."
  end

  second = ""
  loop do
    prompt "What is second number?"
    second = gets.chomp
    break if valid_number?(second)
    prompt "It doesn't seem to be a valid number. Please try again."
  end

  prompt <<-MSG
  What operation do you want to do?
    1) Addition
    2) Subtraction
    3) Multiplication
    4) Division
  MSG

  operation = ""
  loop do
    operation = gets.chomp
    break if valid_operation?(operation)
    prompt "It's not a valid operation. Please try again."
  end

  prompt "#{operation_to_message(operation)} two numbers..."

  case operation
  when "1"
    prompt "#{first} + #{second} = #{first.to_i + second.to_i}"
  when "2"
    prompt "#{first} - #{second} = #{first.to_i - second.to_i}"
  when "3"
    prompt "#{first} * #{second} = #{first.to_i * second.to_i}"
  when "4"
    prompt "#{first} / #{second} = #{first.to_f / second.to_f}"
  end

  prompt "Do you want to continue? (Y = another calculation)"
  break unless gets.chomp.casecmp?("y")
end
