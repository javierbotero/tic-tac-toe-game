#!/usr/bin/env ruby
require './lib/board'
require './lib/player'

def user_input(player, game)
  puts "please #{player.name} choose the square that you want to put your mark in:"
  loop do
    user_choice = gets.chomp.to_i
    if user_choice < 10 && user_choice.positive?
      begin
        game.add_marker(player.symbol, user_choice)
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
  puts '--- Board ---'

  print '|'
  game.board.each_with_index do |value, index|
    print "\n-------------\n|" if [3, 6].include?(index)
    print " #{value.empty? ? ' ' : value} |"
  end
  puts ''
end

def play_again
  answer = false

  loop do
    puts 'do you want to play again?(Y/N)'
    answer = gets.chomp

    break if %w[Y y N n].include?(answer)

    puts 'Wrong input you must choose Y or N'
  end

  answer
end

def no_winner?(game, p1, p2)
  game_on = true
  number = 0

  while game_on
    if number.even?
      user_input(p1, game)
    else
      user_input(p2, game)
    end

    display_board(game)

    winner = game.winner
    if winner
      puts winner == p1.symbol ? display_score(p1, p2) : display_score(p2, p1)

      game_on = false
    end

    return game_on if number == 8
    number += 1
  end

  game_on
end

def display_score(p1, p2)
  p1.inc_score
  %( 
#{p1.name} is the winner
---- Scores ----
#{p1.name}: #{p1.score} wins
#{p2.name}: #{p2.score} wins
  )
end

def build_player(symbol, compared_player = false)
  player = false

  loop do
    begin
      puts "Please enter your name(#{symbol}):"
      player = Player.new(gets.chomp, symbol)

      if compared_player && player.name == compared_player.name
        puts "Really even if you are twins you can't have the same name?? O.o"
        next
      end
    rescue ArgumentError => e
      puts e.message
    else
      break
    end
  end

  player if player
end

def init
  puts '--- Welcome to Zack\'s and Javier Tic Tac Toe Game ---'

  player_x = build_player('X')
  player_o = build_player('O', player_x)

  loop do
    game = Board.new

    puts '----- this is how you can select your square ------'
    puts 'basically just by choosing the square number'

    puts "| 1 | 2 | 3 |\n-------------\n| 4 | 5 | 6 |\n-------------\n| 7 | 8 | 9 |"

    puts '--- Board ---'
    puts "|   |   |   |\n-------------\n|   |   |   |\n-------------\n|   |   |   |"

    puts 'no winner for now foolks' if no_winner?(game, player_x, player_o)

    break if %w[N n].include?(play_again)
  end
end

init
