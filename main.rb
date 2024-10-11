#
require './board'

board = Board.new

loop do
  turn = 1
  puts '1. Start game'
  puts '2. Exit game'
  user_input = gets.to_i
  break if user_input == 2

  if user_input == 1
    board.empty!
    loop do
      puts "Turn of player ##{turn}"
      board.print_board

      puts ''
      print 'Input a column: '
      column = gets.to_i - 1
      print 'Input a row: '
      row = gets.to_i - 1

      if board.place_token(row, column, turn)
        if board.draw?
          puts "I't a draw, neither has won"
          puts ''
          puts ''
          break
        end

        if board.winner?
          puts "The player ##{turn} has won!"
          puts ''
          puts ''
          break
        end

        if turn == 1 
          turn = 2
        else 
          turn = 1
        end
      else
        puts 'There was an error'
      end
    end
  else
    puts 'Please input only a digit between 1-2'
  end
end
