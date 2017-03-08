CHOICES_TO_KEYS = { "r" => "Rock",
                    "p" => "Paper",
                    "s" => "Scissors",
                    "l" => "Lizard",
                    "o" => "spOck"}

CHOICES_WORDS = CHOICES_TO_KEYS.values
VALID_INPUTS = CHOICES_TO_KEYS.keys
WINNING_CONDITIONS =
 [["Spock", "Rock"],
  ["Spock", "Scissors"],
  ["Scissors", "Paper"],
  ["Scissors", "Lizard"],
  ["Paper", "Rock"],
  ["Paper", "Spock"],
  ["Rock", "Lizard"],
  ["Rock", "Scissors"],
  ["Lizard", "Spock"],
  ["Lizard", "Paper"]]

scores = {computer: 0, player: 0}

def prompt(message)
  puts "=> #{message}"
end

def convert_to_names(key)
  CHOICES_TO_KEYS[key].capitalize
end

def print_choices(player_choice_key, computer_choice_key)
  player_choice = convert_to_names(player_choice_key)
  computer_choice = convert_to_names(computer_choice_key)
  puts
  puts "You chose #{player_choice}, computer chose #{computer_choice}"
end

def who_wins(player_choice_key, computer_choice_key)
  player_choice = convert_to_names(player_choice_key)
  computer_choice = convert_to_names(computer_choice_key)
  if WINNING_CONDITIONS.include?([player_choice, computer_choice])
    :player
  elsif WINNING_CONDITIONS.include?([computer_choice, player_choice])
    :computer
  else
    :tie
  end
end

def change_scores(winner, scores)
  scores[winner] += 1 unless winner == :tie
end

def print_scores(scores)
    prompt "score (you:computer) #{scores[:player]}:#{scores[:computer]}"
end


# Main program
puts "-------------------------------------------"
puts "Welcome to rock-paper-scissors-lizard-Spock"
puts "-------------------------------------------"
puts "For your choice, type first letter only (or 'o' for SpOck)"
puts
loop do
  player_choice = ""

  # User choice
  loop do
    prompt CHOICES_WORDS.join(", ") + "?"
    player_choice = gets.chomp.strip.downcase

    if VALID_INPUTS.include?(player_choice)
      break
    else
      prompt "Not a valid choice. Type first letter only (or 'o' for SpOck)"
    end
  end

  # Computer choice and results
  computer_choice = VALID_INPUTS.sample
  print_choices(player_choice, computer_choice)
  winner = who_wins(player_choice, computer_choice)
  change_scores(winner, scores)
  print_scores(scores)

  break if scores[:player] == 5 || scores[:computer] == 5
end
puts "-----------------------------------"
puts "#{scores[:player] == 5 ? 'Congratulations, you' : 'Computer'} won. Game over."
puts "-----------------------------------"

