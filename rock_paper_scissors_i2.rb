VALID_CHOICES = %w(rock paper scissors)

def prompt(text)
  puts ">> #{text}"
end

def win?(first, second)
  (first == "rock" && second == "scissors") ||
    (first == "paper" && second == "rock") ||
    (first == "scissors" && second == "paper")
end

def display_results(choice, computer_choice)
  if win?(choice, computer_choice)
    prompt "You won!"
  elsif win?(computer_choice, choice)
    prompt "Computer won!"
  else
    prompt "It's a tie"
  end
end

puts "======================================"
puts "Hello, welcome to rock-paper-scissors"
puts "======================================"

choice = nil

loop do
  loop do
    prompt "Your choice? (#{VALID_CHOICES.join(', ')})"
    choice = gets.chomp
    if VALID_CHOICES.include?(choice.downcase)
      break
    end
    prompt "Please enter one of: #{VALID_CHOICES.join(', ')}"
  end

  computer_choice = VALID_CHOICES.sample

  prompt "You chose #{choice.upcase}, computer chose #{computer_choice.upcase}"
  display_results(choice, computer_choice)

  prompt "Do you want to continue? (y/n)"
  break if gets.chomp.casecmp("y")
end
prompt "Thank you for playing!"
