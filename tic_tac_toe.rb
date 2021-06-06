class TicTacToe
  attr_reader :player, :tic_tac_toe_state
  def initialize
    # initial state
    @row = 0
    @col = 0
    @player = ''
    @tic_tac_toe_state = [[nil,nil,nil],[nil,nil,nil],[nil,nil,nil]]
  end

  def play(row, col, player)
    @row = row
    @col = col
    @player = player

    # a few small validation checks
    return 'Off the board' if @row > 3 || @col > 3
    return 'That position is already taken' if !tic_tac_toe_state[@row-1][@col-1].nil?
    
    check_winner

    display_board
  end

  def display_board
    # print the current state
    puts <<-HEREDOC
      #{display_position(0,0)} | #{display_position(0,1)} | #{display_position(0,2)}
      ---+---+---
      #{display_position(1,0)} | #{display_position(1,1)} | #{display_position(1,2)}
      ---+---+---
      #{display_position(2,0)} | #{display_position(2,1)} | #{display_position(2,2)}
    HEREDOC
  end

  def display_position(row,col)
    if row && col && !tic_tac_toe_state[row][col].nil?
      tic_tac_toe_state[row][col]
    else
      "-"
    end
  end


  def reset_board
    # reset state
    @tic_tac_toe_state = [[nil,nil,nil],[nil,nil,nil],[nil,nil,nil]]
  end

  def check_winner
    # save the move
    tic_tac_toe_state[@row-1][@col-1] = player
    
    # check for a winning play
    row_winner?

    col_winner?

    diagonal_winner?
  end

  def row_winner?
    # check each row if there's a winner aka row win
    tic_tac_toe_state.each do |pos|
      if pos[0] == player && pos[1] == player && pos[2] == player
        puts 'Row Winner, resetting the board'
        reset_board
      end
    end
  end

  def col_winner?
    # check each column if there's a winner aka column win
    row = 0
    col = 0
    while col < 3
      if tic_tac_toe_state[row][col] == player && 
        tic_tac_toe_state[row + 1][col] == player &&
        tic_tac_toe_state[row + 2][col] == player
        puts 'Column Winner, resetting the board'
        reset_board
      end
      col += 1
    end
  end

  def diagonal_winner?
     # Check for a diagonal winner
     row = 0
     col = 0
       if tic_tac_toe_state[row][col] == player &&
         tic_tac_toe_state[row + 1][col + 1] == player &&
         tic_tac_toe_state[row + 2][col + 2] == player
           puts 'Diagonal Winner, resetting the board'
           reset_board
       end
  end
end

