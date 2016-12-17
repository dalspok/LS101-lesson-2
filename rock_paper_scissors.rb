VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && second == "scissors") ||
    (first == 'paper' && second == "rock") ||
    (first == 'scissors' && second == "paper")
end

def display_results(choice, computer_choice)
  if win?(choice, computer_choice)
    prompt("You win!")
  elsif win?(computer_choice, choice)
    prompt("Computer wins!")
  else
    prompt("It's a tie")
  end
end

loop do
  choice = ""
  loop do
    prompt VALID_CHOICES.join(", ") + "?"
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt "Not a valid choice."
    end
  end

  computer_choice = VALID_CHOICES.sample
  puts "You chose #{choice}, computer chose #{computer_choice}"

  display_results(choice, computer_choice)
  prompt "Do you want to quit? ('q')"
  break if gets.chomp.downcase.start_with?("q")
end
