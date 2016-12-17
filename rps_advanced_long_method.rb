
CHOICES_TO_KEYS = { "r" => ["Rock", 5],
                    "p" => ["Paper", 3],
                    "s" => ["Scissors", 1],
                    "l" => ["Lizard", 2],
                    "o" => ["spOck", 4] }

VALID_CHOICES = CHOICES_TO_KEYS.values.map { |item| item[0] }
VALID_INPUTS = CHOICES_TO_KEYS.keys
score = [0, 0]

def prompt(message)
  puts "=> #{message}"
end

def display_results(user_choice, computer_choice, score)
  case (CHOICES_TO_KEYS[user_choice][1] -
    CHOICES_TO_KEYS[computer_choice][1]) % 5
  when (3..4)
    prompt("You win!")
    change_score(1, 0, score)
  when (1..2)
    prompt("Computer wins!")
    change_score(0, 1, score)
  else
    prompt("It's a tie")
  end
end

def change_score(player, computer, score)
  score[0] += player
  score[1] += computer
end

# Main program

puts "-------------------------------------------"
puts "Welcome to rock-paper-scissors-lizard-Spock"
puts "-------------------------------------------"
puts "For your choice, type first letter only (or 'o' for SpOck)\n"
loop do
  user_choice = ""

  # Enter user choice

  loop do
    prompt VALID_CHOICES.join(", ") + "?"
    user_choice = gets.chomp.strip.downcase

    if VALID_INPUTS.include?(user_choice)
      break
    else
      prompt "Not a valid choice. type first letter only (or 'o' for SpOck)"
    end
  end

  # Compute results

  computer_choice = VALID_INPUTS.sample

  output_user_choice = CHOICES_TO_KEYS[user_choice][0].upcase
  output_computer_choice = CHOICES_TO_KEYS[computer_choice][0].upcase
  puts "\nYou chose #{output_user_choice}, " \
    "computer chose #{output_computer_choice}"
  display_results(user_choice, computer_choice, score)

  # Score?

  prompt "SCORE (you:computer) #{score[0]}:#{score[1]}"
  break if score[0] == 5 || score[1] == 5
end
puts "-----------------------------------"
puts "#{score[0] == 5 ? 'Congratulations, you' : 'Computer'} won. Game over."
puts "-----------------------------------"
