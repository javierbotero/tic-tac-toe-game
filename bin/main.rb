#!/usr/bin/env ruby

puts "---------- This is a Tic Tac Toe Game ----------"

while true
  puts "please player number 1 (X) enter your name:"
  player1 = gets.chomp
  
  puts "please player number 2 (O) enter your name:"
  player2 = gets.chomp
  
  puts "----- this is how you can select your square ------"
  puts "basically just by choosing the square number"
  
  puts "| 1 | 2 | 3 |\n-------------\n| 4 | 5 | 6 |\n-------------\n| 7 | 8 | 9 |"
  
  puts "show the board"
  puts "------------- Board ------------"
  puts "|  |  |  |\n----------\n|  |  |  |\n----------\n|  |  |  |"
  
  9.times do |number|
    if number.even?
      puts "please #{player1} choose the square that you want to put your mark in:"
      user_choice = gets.chomp
      puts "treat player1 choice"
      puts "show the boarder"
    else
      puts "please #{player2} choose the square that you want to put your mark in:"
      user_choice = gets.chomp
      puts "treat player2 choice"
      puts "show the boarder"
    end

    puts "check for the winner if so print it"
  end

  puts "if there is no winner print no winner for now foolks"
  
  answer = nil

  while true
    puts "do you want to play again?(Y/N)"
    answer = gets.chomp

    if answer == 'Y' || answer == 'N' || answer == 'y' || answer == 'n'
      break
    end
  end

  if answer == 'N' || answer == 'n'
    break
  end
end
