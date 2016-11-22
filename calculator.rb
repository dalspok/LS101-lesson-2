def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  number.to_i.nonzero?
end

prompt "Welcome to Calculator! Enter your name:"

name = ""

loop do
  name = gets.chomp

  if name.empty?
    prompt "Valid name"
  else
    break
  end
end

loop do
  number1 = ""
  loop do
    prompt "What's the first number?"
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt "Again, incorrect"
    end
  end

  number2 = ""
  loop do
    prompt "What's the second number?"
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt "Again, incorrect"
    end
  end

  prompt "What operation? 1)+ 2)- 3)* 4) /"
  operator = ""
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      puts "Incorrect"
    end
  end
  result =  case operator
            when "1"
              number1.to_i + number2.to_i
            when "2"
              number1.to_i - number2.to_i
            when "3"
              number1.to_i * number2.to_i
            when "4"
              number1.to_f / number2.to_f
            end

  prompt result

  prompt "Continue? Y/N"

  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end
