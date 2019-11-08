
def display_results(player, computer)
  puts "You chose #{player}, computer chose #{computer}"
  if winner?(player, computer)
    puts "You won"
  elsif winner?(computer, player)
    puts "Computer won"
  else
    puts "It's a tie"
  end
end

def winner?(first, second)
  first == "rock" && second == "scissors" ||
    first == "paper" && second == "rock" ||
    first == "scissors" && second == "paper"
end

VALID_CHOICES = %w(rock paper scissors)

def valid?(choice)
  VALID_CHOICES.include? choice
end

puts "Welcome to Rock - Paper - Scissors"

choice = ""
loop do
  puts "What is your choice? #{VALID_CHOICES}"
  choice = gets.chomp.downcase
  break if valid?(choice)
  puts "It does not seem to be a valid choice."
end

computer_choice = VALID_CHOICES.sample
display_results(choice, computer_choice)
