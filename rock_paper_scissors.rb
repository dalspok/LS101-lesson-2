VALID_CHOICES = ["rock", "paper", "scissors"]


def prompt(message)
  puts ("=> #{message}")
end

choice = ""
loop do

  prompt (VALID_CHOICES.join(", ") + "?")
  choice = gets.chomp

  if VALID_CHOICES.include?(choice)
    break
  else
    prompt "Not a valid choice."
  end
end
  

computer_choice = VALID_CHOICES.sample



puts "You chose #{choice}, computer chose #{computer_choice}"

