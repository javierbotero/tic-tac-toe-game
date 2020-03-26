#!/usr/bin/env ruby
require './lib/logic'

def user_input(player, game)
  puts "please #{player} choose the square that you want to put your mark in:"
  loop do
    user_choice = gets.chomp.to_i
    if user_choice < 10 && user_choice.positive?
      begin
        game.add_marker(player, user_choice)
        break
      rescue ArgumentError => e
        puts e.message
      end
    else
      puts 'You should select a number between 1 and 9'
    end
  end
end

def display_board(game)
  puts '-------- Board --------'
  
  print '|'
  game.board.each_with_index do |value, index|
    print "\n-------------\n|" if [3,6].include?(index)
    print " #{value.empty? ? ' ' : value} |"
  end
  puts ""
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

def no_winner?(game)
  9.times do |number|
    if number.even?
      user_input(game.player_x, game)
    else
      user_input(game.player_o, game)
    end

    display_board(game)

    if game.winner
      puts "#{ game.winner == "X" ? game.player_x : game.player_o} is the winner"

      return false
    end
  end

  true
end

def init
  puts '---------- This is a Tic Tac Toe Game ----------'

  loop do
    puts 'please player number 1 (X) enter your name:'
    player1 = gets.chomp

    puts 'please player number 2 (O) enter your name:'
    player2 = gets.chomp

    game = TicTacToe.new(player1, player2)

    puts '----- this is how you can select your square ------'
    puts 'basically just by choosing the square number'

    puts "| 1 | 2 | 3 |\n-------------\n| 4 | 5 | 6 |\n-------------\n| 7 | 8 | 9 |"

    puts '-------- Board --------'
    puts "|   |   |   |\n-------------\n|   |   |   |\n-------------\n|   |   |   |"

    puts 'no winner for now foolks' if no_winner?(game)

    break if %w[N n].include?(play_again)
  end
end

init
