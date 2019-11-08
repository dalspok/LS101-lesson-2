
VALID_CHOICES = %w(rock paper scissors lizard Spock)
VALID_INPUTS = %w(r p s l o)
CHOICES_FROM_INPUTS = {"r" => "rock", "p" => "paper", "s" => "scissors",
                    "l" => "lizard", "o" => "Spock"}

WINNING_MOVES = { "rock" => ["lizard", "scissors"],
                  "paper" => ["rock", "Spock"],
                  "scissors" => ["paper", "lizard"],
                  "Spock" => ["rock", "scissors"],
                  "lizard" => ["paper", "Spock"]
                }

FINAL_SCORE = 5
score = {"Player" => 0, "Computer" => 0}

def game_initiation
  puts "Welcome to Rock-paper-scissors-lizard-Spock!"
  puts "We will play till #{FINAL_SCORE} winning rounds."
end

def reset_game(score)
  score["Player"], score["Computer"] = 0, 0
end

def obtain_player_choice
  loop do
    puts "What is your choice: (R)ock - (P)aper - (S)cissors - (L)izard - Sp(O)ck?"
    player_input = gets.chomp.downcase
    return CHOICES_FROM_INPUTS[player_input] if VALID_INPUTS.include? player_input
    puts "Sorry, not a valid choice"
  end
end

def winner(player_choice, computer_choice)
  if WINNING_MOVES[player_choice].include? computer_choice
    "Player"
  elsif WINNING_MOVES[computer_choice].include? player_choice
    "Computer"
  else
    nil
  end
end

def display_result(player_choice, computer_choice)
  puts "You chose: #{player_choice}"
  puts "Computer chose: #{computer_choice}"
  winner = winner(player_choice, computer_choice)
  if winner
    puts "#{winner} won."
  else
    puts "It's a tie"
  end
end

def update_score(player_choice, computer_choice, score)
  winner = winner(player_choice, computer_choice)
  if winner
    score[winner] += 1
  end
end

def total_winner(score)
  if score["Computer"] == FINAL_SCORE
    "Computer"
  elsif score["Player"] == FINAL_SCORE
    "Player"
  else
    nil
  end
end

def display_score(score)
  puts "SCORE (Player:Computer) - #{score["Player"]}:#{score["Computer"]}"
end

#MAIN PROGRAM

game_initiation
reset_game(score)

loop do
  player_choice = obtain_player_choice
  computer_choice = VALID_CHOICES.sample
  display_result(player_choice, computer_choice)
  update_score(player_choice, computer_choice, score)
  display_score(score)
  if total_winner(score)
    puts "#{total_winner(score)} won the game!"
    break
  end
end

puts "Thank's for playing"






