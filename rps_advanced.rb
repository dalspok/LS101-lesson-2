
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

def print_result(difference)
  prompt case difference
         when (3..4)
           "You win!"
         when (1..2)
           "Computer wins!"
         else
           "It's a tie"
         end
end

def print_choices(user_choice, computer_choice)
  output_user_choice = CHOICES_TO_KEYS[user_choice][0].upcase
  output_computer_choice = CHOICES_TO_KEYS[computer_choice][0].upcase
  puts "\nYou chose #{output_user_choice}, " \
    "computer chose #{output_computer_choice}"
end

def compute_results(user_choice, computer_choice, score)
  print_choices(user_choice, computer_choice)
  difference = (CHOICES_TO_KEYS[user_choice][1] -
    CHOICES_TO_KEYS[computer_choice][1]) % 5
  print_result(difference)
  change_score(difference, score)
end

def change_score(difference, score)
  case difference
  when (3..4)
    score[0] += 1
  when (1..2)
    score[1] += 1
  end
end

# Main program
puts "-------------------------------------------"
puts "Welcome to rock-paper-scissors-lizard-Spock"
puts "-------------------------------------------"
puts "For your choice, type first letter only (or 'o' for SpOck)\n"
loop do
  user_choice = ""

  # User choice
  loop do
    prompt VALID_CHOICES.join(", ") + "?"
    user_choice = gets.chomp.strip.downcase

    if VALID_INPUTS.include?(user_choice)
      break
    else
      prompt "Not a valid choice. type first letter only (or 'o' for SpOck)"
    end
  end

  # Computer choice and results
  computer_choice = VALID_INPUTS.sample
  compute_results(user_choice, computer_choice, score)

  # Score?
  prompt "SCORE (you:computer) #{score[0]}:#{score[1]}"
  break if score[0] == 5 || score[1] == 5
end
puts "-----------------------------------"
puts "#{score[0] == 5 ? 'Congratulations, you' : 'Computer'} won. Game over."
puts "-----------------------------------"
