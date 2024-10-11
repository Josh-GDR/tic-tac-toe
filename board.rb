class Board
  def initialize
    puts 'Hola mundo!'
    @board = Array.new(3) { Array.new(3) }
  end

  def empty!
    @board.map! do |row|
      row.map! { |element| element = 0 }
    end
  end

  def place_token(row, col, token)
    return false if (row > 2 && col > 2)
    return false if @board[row][col] != 0

    @board[row][col] = token 
    true
  end

  def print_board
    show_columns
    show_board
  end

  def winner?
    if @board[0][0] != 0

      return true if (@board[0][0] == @board[1][1]) && @board[0][0] == @board[2][2]

      return true if (@board[0][0] == @board[1][0]) && @board[0][0] == @board[2][0]

      return true if (@board[0][0] == @board[0][1]) && @board[0][0] == @board[0][2]

    end 
    if @board[2][2] != 0
      
      return true if (@board[0][2] == @board[1][2]) && @board[0][2] == @board[2][2]
  
      return true if (@board[2][0] == @board[2][1]) && @board[2][0] == @board[2][2]

    end
    if @board[1][1] != 0

      return true if (@board[0][1] == @board[1][1]) && @board[0][1] == @board[2][1]

      return true if (@board[1][0] == @board[1][1]) && @board[1][0] == @board[1][2]

    end

    false
  end

  def draw?
    @board.each do |row|
      row.each {|col| return false if col == 0}
    end

    true
  end

  def length
    @board.length
  end

  private def show_board
    @board.each_with_index do |row, index|
      print "#{index + 1} [ "
      row.each do |element|
        print element
        print ' '
      end
      print ']'
      puts ''
    end
  end

  private def show_columns
    print '    '
    (1..3).each { |i| print "#{i} " }
    puts ''
  end
end
