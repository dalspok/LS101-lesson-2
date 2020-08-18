VALID_CHOICES = { "r" => "rock",
                  "p" => "paper",
                  "s" => "scissors",
                  "l" => "lizard",
                  "o" => "Spock" }

WINNING_MOVES = { "rock" => ["lizard", "scissors"],
                  "lizard" => ["paper", "Spock"],
                  "Spock" => ["scissors", "rock"],
                  "scissors" => ["paper", "lizard"],
                  "paper" => ["rock", "Spock"] }

ROUNDS = 5

def valid?(choice_index)
  VALID_CHOICES.keys.include? choice_index
end

def display_scores(scores)
  puts "You:Computer #{scores['Player']}:#{scores['Computer']}"
  puts
end

def display_welcome_message
  puts "Welcome to Rock-paper-scissors-lizard-Spock"
  puts "-------------------------------------------"
end

def determine_winner(player, computer)
  if WINNING_MOVES[player].include? computer
    "Player"
  elsif WINNING_MOVES[computer].include? player
    "Computer"
  end
end

def display_result(player, computer)
  puts "You chose #{player}, computer chose #{computer}"

  winner = determine_winner(player, computer)
  case winner
  when "Player"
    puts "You won"
  when "Computer"
    puts "Computer won"
  else
    puts "It's a tie"
  end
end

def determine_player_choice
  loop do
    puts "What's your choice? (R)ock-(P)aper-(S)cissors-(L)izard-Sp(o)ck?"
    player_choice_index = gets[0].downcase

    return VALID_CHOICES[player_choice_index] if valid?(player_choice_index)
    puts "Not a valid choice. Please try again."
  end
end

def total_winner(scores)
  if scores["Player"] == ROUNDS
    "Player"
  elsif scores["Computer"] == ROUNDS
    "Computer"
  end
end

def update_scores(scores, player, computer)
  winner = determine_winner(player, computer)
  scores[winner] += 1 if winner
end

def display_total_winner(scores)
  puts "#{total_winner(scores)} won the game."
end

# main loop
scores = { "Player" => 0, "Computer" => 0 }
display_welcome_message
display_scores(scores)

loop do
  player_choice = determine_player_choice
  computer_choice = VALID_CHOICES.values.sample
  update_scores(scores, player_choice, computer_choice)
  display_result(player_choice, computer_choice)
  display_scores(scores)
  break if total_winner(scores)
end

display_total_winner(scores)
