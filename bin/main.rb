#!/usr/bin/env ruby

def user_input(player)
  user_choice = false

  puts "please #{player} choose the square that you want to put your mark in:"
  loop do
    user_choice = gets.chomp.to_i
    if user_choice < 10 && user_choice.positive?
      # treat player choice
      puts ''
      break
    else
      puts 'You should select a number between 1 and 9'
    end
  end

  user_choice
end

def play_again
  answer = false

  loop do
    puts 'do you want to play again?(Y/N)'
    answer = gets.chomp

    if answer == 'Y' || answer == 'N' || answer == 'y' || answer == 'n'
      break
    else
      puts 'Wrong input you must choose Y or N'
    end
  end

  answer
end

def init
  puts '---------- This is a Tic Tac Toe Game ----------'

  loop do
    puts 'please player number 1 (X) enter your name:'
    player1 = gets.chomp

    puts 'please player number 2 (O) enter your name:'
    player2 = gets.chomp

    puts '----- this is how you can select your square ------'
    puts 'basically just by choosing the square number'

    puts '| 1 | 2 | 3 |\n-------------\n| 4 | 5 | 6 |\n-------------\n| 7 | 8 | 9 |'

    puts '-------- Board --------'
    puts '|   |   |   |\n-------------\n|   |   |   |\n-------------\n|   |   |   |'

    9.times do |number|
      if number.even?
        user_choice = user_input(player1)

        # show the board
        puts '------------ Board ----------'
      else
        user_choice = user_input(player2)

        # show the board
        puts '---------- Board -----------'
      end

      # check for the winner if so print it
      # puts "#{player1} is the winner" if false
    end

    puts 'no winner for now foolks' if true

    answer = play_again

    if answer == 'N' || answer == 'n'
      break
    end
  end
end

init
