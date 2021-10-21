class Board
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8],[2,4,6]]

  attr_accessor :board, :p1_combos, :p2_combos, :p1_moves, :p2_moves
  def initialize
    @board = [1,2,3,4,5,6,7,8,9]
    @p1_moves = []
    @p1_combos = []
    @p2_moves = []
    @p2_combos = []
    @win_combo = WIN_COMBINATIONS
  end

  def print_game_board
    puts " #{board[0]}|#{board[1]}|#{board[2]}".center(38)
    puts " #{board[3]}|#{board[4]}|#{board[5]}".center(38)
    puts " #{board[6]}|#{board[7]}|#{board[8]}".center(38)
  end

  def replay
    @board = [1,2,3,4,5,6,7,8,9]
    @p1_moves = []
    @p2_moves = []
  end

  def add_move(position, mark)
    board[position - 1] = mark
  end

  def valid_move?(position)
    position.between?(1, 9) && board[position - 1].is_a?(Integer)
  end

  def draw?(board)
    @board.any?(Integer)
  end

  def p1_moves(position)
    @p1_moves << (position - 1)
    @p1_combos = @p1_moves.combination(3).to_a
  end

  def p2_moves(position)
    @p2_moves << (position - 1)
    @p2_combos = @p2_moves.combination(3).to_a
  end

  def p1_won?
    @p1_combos.each do |combo|
      if @win_combo.sort.any?(combo.sort)
        return true
      end
    end
  end

  def p2_won?
    @p2_combos.each do |combo|
      if @win_combo.sort.any?(combo.sort)
        return true
      end
    end
  end
end

class Player
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

p1 = Player.new('p1')
p2 = Player.new('p2')
board = Board.new
game_over = false
replay = true

while replay == true
  puts 'TIC-TAC-TOE'.center(40)
  puts "You're playing a tic-tac-toe game, developed by Matheus Vidal"
  puts "This is a two player game, please insert player number one's name: "
  p1.name = gets.chomp
  puts "Now please insert player number two's name: "
  p2.name = gets.chomp
  puts "All set #{p1.name} and #{p2.name} enjoy the game!"
  board.print_game_board
  puts "Each player must select a position inside the board, and try to make a straight line to win. \nnone of the players are allowed to overtake the other player position"
  while game_over == false
    if board.draw?(board) == false
      puts "It's a Draw!"
      game_over = true
      break
    end
    puts "#{p1.name} what is your move?"
    position = gets.chomp.to_i
    while board.valid_move?(position) == false
      puts "Please #{p1.name} select another position"
      position = gets.chomp.to_i
    end
    board.p1_moves(position)
    board.add_move(position, 'X')
    board.print_game_board
    if board.p1_won? == true
      puts "Congratulations #{p1.name} you are the winner!"
      game_over = true
      break
    end
    if board.draw?(board) == false
      puts "It's a Draw!"
      game_over = true
      break
    end
    puts "#{p2.name} what's your move?"
    position = gets.chomp.to_i
    while board.valid_move?(position) == false
      puts "Please #{p2.name} select another position"
      position = gets.chomp.to_i
    end
    board.p2_moves(position)
    board.add_move(position, 'O')
    board.print_game_board
    if board.p2_won? == true
      game_over = true
      p "Congratulations #{p2.name} you are the winner!"
      break
    end
  end
    puts "That was a nice game, if do you wanna play again, press Y if you don't press N"
    answer = gets.chomp.to_s.upcase
    if answer == "Y"
      replay = true
      game_over = false
      board.replay
    elsif answer == "N"
      return replay = false
      break
    else puts "Please answer only with Y or N, Do you wanna play again? Y/N"
      answer = gets.chomp.to_s.upcase
    end
  if replay == false
    break
  end
end
