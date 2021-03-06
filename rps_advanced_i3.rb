
LETTERS_TO_CHOICES = { "r" => "Rock", "p" => "Paper", "s" => "Scissors",
                       "l" => "Lizard", "o" => "spOck" }
VALID_CHOICES = LETTERS_TO_CHOICES.values
FINAL_POINTS = 5
WINNING_CONDITIONS = { "rock" => ["lizard", "scissors"],
                       "paper" => ["rock", "spock"],
                       "scissors" => ["paper", "lizard"],
                       "spock" => ["rock", "scissors"],
                       "lizard" => ["spock", "paper"] }

def choices_with_capitalization
  VALID_CHOICES.map(&:capitalize).join("-")
end

def ask_for_player_choice
  loop do
    puts
    puts "What is your choice? #{VALID_CHOICES.join(', ')}?"
    input_char = gets.chomp.strip.downcase[0]
    if LETTERS_TO_CHOICES.fetch(input_char, false)
      return LETTERS_TO_CHOICES[input_char].downcase
    end
    puts "Incorrect input. Please try again."
  end
end

def find_winner(player_choice, computer_choice)
  if WINNING_CONDITIONS[player_choice].include?(computer_choice)
    :player
  elsif WINNING_CONDITIONS[computer_choice].include?(player_choice)
    :computer
  else
    :tie
  end
end

def evaluate_play(winner)
  if winner == :tie
    puts "It's a tie."
  else
    SCORES[winner] += 1
    puts "#{winner.to_s.capitalize} won. \
      (Player: Computer #{SCORES[:player]}:#{SCORES[:computer]})"
  end
end

def final_winner
  if SCORES[:player] == FINAL_POINTS
    "player"
  elsif SCORES[:computer] == FINAL_POINTS
    "computer"
  else
    false
  end
end

def play_again?
  loop do
    puts
    puts "Do you want to play again (y/n)"
    case gets.chomp.strip.downcase[0]
    when "y" then return true
    when "n" then return false
    end
    puts "Sorry. I do not understand."
  end
end

# ===  GAME SETTING ===

loop do
  SCORES = { player: 0, computer: 0 }
  system "clear"
  puts
  puts "Welcome to #{choices_with_capitalization}"
  puts "You choose by typing first letter (or 'O' for Spock)"
  puts

  # ===  PLAY LOOP RUNNING ===

  loop do
    player_choice = ask_for_player_choice
    computer_choice = VALID_CHOICES.sample.downcase
    puts "You: #{player_choice.capitalize}"
    puts "Computer: #{computer_choice.capitalize}"
    winner = find_winner(player_choice, computer_choice)
    evaluate_play winner
    break if final_winner
  end

  # ===  AFTER PLAY LOOP ===

  puts
  puts "*******************************"
  puts "Final winner is #{final_winner}"
  puts "*******************************"

  break unless play_again?
end

puts "Thank you for playing with me"
