def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  number.to_i != 0
end

OPERATION_TO_NAME = {"1" => "Adding",
                     "2" => "Subtracting",
                     "3" => "Multiplying",
                     "4" => "Dividing" }

OPERATION_PROMPT = <<-MSG
  What operation would you like to do?
  1)addition
  2)subtraction
  3)multiplication
  4)division
MSG

def valid_operation?(operation)
  %w(1 2 3 4).include? operation
end

prompt("Welcome to calculator")
first_num, second_num, operation = ""

loop do # main loop
  loop do
    prompt("What is first number?")
    first_num = gets.chomp
    if valid_number?(first_num)
      first_num = first_num.to_i
      break
    end
    prompt("It does not seem to be a valid number. Pleasy try again.")
  end


  loop do
    prompt("What is second number?")
    second_num = gets.chomp
    if valid_number?(second_num)
      second_num = second_num.to_i
      break
    end
    prompt("It does not seem to be a valid number. Pleasy try again.")
  end

  prompt OPERATION_PROMPT

  loop do
    operation = gets.chomp
    break if valid_operation?(operation)
    prompt "It does not seem to be a valid operation. Choose 1,2,3,or 4."
  end

  puts "#{OPERATION_TO_NAME[operation]} numbers..."

  case operation
  when "1"
    result = first_num + second_num
  when "2"
    result = first_num - second_num
  when "3"
    result = first_num * second_num
  when "4"
    result = first_num / second_num.to_f
  end

  puts "The result is #{result}"
  puts
  puts "Do you want to continue? (Y)"
  continue = gets.chomp
  break unless continue.downcase.start_with?("y")
end

puts "Thank you for using calculator. Bye."

