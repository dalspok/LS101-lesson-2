VALID_CHOICES = { "r" => "Rock",
                  "p" => "Paper",
                  "s" => "Scissors",
                  "l" => "Lizard",
                  "k" => "Spock" }

WINNING_MOVES = { "Rock" => ["Lizard", "Scissors"],
                  "Paper" => ["Rock", "Spock"],
                  "Scissors" => ["Paper", "Lizard"],
                  "Lizard" => ["Paper", "Spock"],
                  "Spock" => ["Rock", "Scissors"] }

def valid_choice?(input)
  VALID_CHOICES.keys.include?(input)
end

def determine_winner(player, computer)
  if WINNING_MOVES[player].include?(computer)
    :player
  elsif WINNING_MOVES[computer].include?(player)
    :computer
  else
    nil
  end
end

def display_result(player, computer)
  puts "You chose #{player}, computer chose #{computer}"
  winner = determine_winner(player, computer)

  case winner
  when :player
    puts "You won"
  when :computer
    puts "Computer won"
  else
    puts "It's a tie"
  end
end

def increment_score(score, winner)
  score[winner] += 1 if winner
end

def total_winner(score)
  if score[:player] == 5
    :player
  elsif score[:computer] == 5
    :computer
  else
    nil
  end
end

def display_score(score)
  puts "You:Computer"
  puts "#{score[:player]} : #{score[:computer]}"
end

puts "Welcome to Rock-Paper-Scissors-Lizard-Spock"
puts
score = { player: 0, computer: 0}

loop do # main loop
  display_score(score)
  player_choice = nil
  loop do
    puts "What is your choice? (R)ock-(P)aper-(S)cissors-(L)izard-Spoc(k)"
    player_input = gets.chomp.downcase
      if valid_choice?(player_input)
        player_choice = VALID_CHOICES[player_input]
        break
      end
    puts "It does not seem to be a correct choice. Please try again."
    puts
  end

  computer_choice = VALID_CHOICES.values.sample
  display_result(player_choice, computer_choice)
  increment_score(score, determine_winner(player_choice, computer_choice))

  break if total_winner(score)
end

puts "Total winner is #{total_winner(score)}."


