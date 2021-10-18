class Board
  TTT_BOARD = Array.new(9, '') { |i| i + 1 }
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8],[6,4,2]]

  attr_accessor :board
  def initialize
    @board = TTT_BOARD
  end

  def print_game_board
    puts " #{board[0]}|#{board[1]}|#{board[2]}".center(38)
    puts " #{board[3]}|#{board[4]}|#{board[5]}".center(38)
    puts " #{board[6]}|#{board[7]}|#{board[8]}".center(38)
  end

  def add_move(position, mark)
    board[position - 1] = mark
  end

  def valid_move?(position)
    position.between?(1, 9) && board[position - 1].is_a?(Integer)
  end

  def draw?(_board)
    @board.any?(Integer)
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

puts 'TIC-TAC-TOE'.center(40)
puts "You're playing a tic-tac-toe game, developed by Matheus Vidal"
puts "This is a two player game, please insert player number one's name: "
p1.name = gets.chomp
puts "Now please insert player number two's name: "
p2.name = gets.chomp
puts "All set #{p1.name} and #{p2.name} enjoy the game!"
board.print_game_board
puts "Each player must select a position inside the board, and try to make a straight line to win. \n none of the players are allowed to overtake the other player position"
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
  board.add_move(position, 'X')
  board.print_game_board
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
  board.add_move(position, 'O')
  board.print_game_board
end

=begin
def p1_moves(position)
 p1_moves_combination = [] << position
 p1_combos = p1_moves_combination.combination(3).to_a
end

def p2_moves(position)
   p2_moves_combination = [] << position
   p2_combos = p1_moves_combination.combination(3).to_a
end

def p1_win?
  winner_combo = WIN_COMBINATIONS
  winner_combo.each do |combo|
    if p1_combos.any?(combo)
      true
    else
      false
    end
  end
end

def p2_win?
  winner_combo = WIN_COMBINATIONS
  winner_combo.each do |combo|
    if p2_combos.any?(combo)
      true
    else
      false
    end
  end
end
=end