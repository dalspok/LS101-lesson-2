
CHOICES_WITH_INDICATORS = %w((R)ock (P)aper (S)cissors (L)izard Sp(o)ck)
CHOICES = { "r" => "rock",
            "p" => "paper",
            "s" => "scissors",
            "l" => "lizard",
            "o" => "Spock" }

WINNING_MOVES = { "rock" => %w(scissors lizard),
                  "paper" => %w(rock Spock),
                  "scissors" => %w(paper lizard),
                  "lizard" => %w(Spock paper),
                  "Spock" => %w(rock scissors) }
FINAL_SCORE = 5
score = {}

def valid?(player_choice)
  CHOICES.keys.include? player_choice.downcase
end

def display_results(player, computer)
  puts "You chose #{CHOICES[player]}"
  puts "Computer chose #{CHOICES[computer]}"
  if winner_exists?(player, computer)
    puts "#{detect_winner(player, computer)} won."
  else
    puts "It's a tie."
  end
  puts
end

def winner_exists?(player, computer)
  %w(Player Computer).include? detect_winner(player, computer)
end

def winner?(first, second)
  first_player_choice = CHOICES[first]
  second_player_choice = CHOICES[second]
  WINNING_MOVES[first_player_choice].include? second_player_choice
end

def detect_winner(player, computer)
  if winner?(player, computer)
    "Player"
  elsif winner?(computer, player)
    "Computer"
  else
    "tie"
  end
end

def reset!(score)
  score["Computer"] = 0
  score["Player"] = 0
end

def display_score(score)
  puts "Player:Computer"
  puts " #{score['Player']} : #{score['Computer']}"
  puts
end

def final_winner(score)
  if score["Player"] == FINAL_SCORE
    "Player"
  elsif score["Computer"] == FINAL_SCORE
    "Computer"
  else
    false
  end
end

def increment_score(score, player, computer)
  winner = detect_winner(player, computer)
  return if winner == "tie"
  score[winner] += 1
end

def display_final_winner(score)
  puts
  puts "Game over. #{final_winner(score)} won the game."
  puts
end

def display_welcome
  puts
  puts "Welcome to rock-paper-scissors-lizard-Spock"
  puts
end

# MAIN LOGIC

display_welcome
reset!(score)

loop do
  display_score(score)

  player_choice = nil
  loop do
    puts "What is your choice - #{CHOICES_WITH_INDICATORS} ?"
    player_choice = gets.chomp
    if valid?(player_choice)
      player_choice.downcase!
      break
    end
    puts "Sorry, it is not a valid choice. Please try again."
  end

  computer_choice = CHOICES.keys.sample

  display_results(player_choice, computer_choice)
  increment_score(score, player_choice, computer_choice)

  if final_winner(score)
    display_final_winner(score)
    break
  end
end
