class Board
  TTT_BOARD = Array.new(9, '') { |i| i + 1 }
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze

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

  def p1_moves(position)
    p1_moves_combination = [] << position
    p1_combos = p1_moves_combination.combination(3).to_a
  end
   
  def p2_moves(position)
    p2_moves_combination = [] << position
    p2_combos = p2_moves_combination.combination(3).to_a
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
end