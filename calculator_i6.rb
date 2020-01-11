OPERATIONS_NAMES = {1 => "addition", 2 => "subtraction", 3 => "multiplication",
                    4 => "division"}

def prompt(text)
  puts "--> #{text}"
end

def valid_number?(num)
  num.to_i.to_s == num
end

def operation_to_name(operation)
  OPERATIONS_NAMES[operation]
end

prompt "What is your name?"

username = nil
loop do
  username = gets.chomp
  break unless username.empty?
  prompt "Please enter non-empty name."
end

prompt "Welcome to calculator, #{username}"

loop do # main loop

  first = nil
  loop do
    prompt "What is the first number?"
    first = gets.chomp
    break if valid_number?(first)
    prompt("This is not a valid number.")
    puts
  end

  second = nil
  loop do
    prompt "What is the second number?"
    second = gets.chomp
    break if valid_number?(second)
    prompt("This is not a valid number.")
    puts
  end

  operation = nil

  prompt "What type of operation do you want to make?"
  puts <<-MSG
  1) addition
  2) subtraction
  3) multiplication
  4) division
  MSG


  loop do
    operation = gets.chomp
    break if %w(1 2 3 4).include? operation
    prompt "This is not a valid operation. Please choose again."
  end

  first = first.to_i
  second = second.to_i
  operation = operation.to_i

  result = case operation
           when 1
            first + second
           when 2
            first - second
           when 3
            first * second
           when 4
            first / second.to_f
          end

  prompt "The result of #{operation_to_name(operation)} is: #{result}"
  prompt "Do you want to calculate again? y/n"
  continue = gets.chomp
  break unless continue.downcase.start_with? "y"
end
