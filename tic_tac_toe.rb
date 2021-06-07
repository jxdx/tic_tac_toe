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
    return 'Wrong player' unless ['x', 'o'].include?(player)
    return 'Off the board' if @row > 3 || @col > 3
    return 'That position is already taken' if !tic_tac_toe_state[@row-1][@col-1].nil?

    # save the move
    tic_tac_toe_state[@row-1][@col-1] = player
    
    check_winner

    display_board
  end

  # print the current state
  def display_board
    pos = 0
    while pos < 3
      puts <<-HEREDOC
        #{display_position(pos,0)} | #{display_position(pos,1)} | #{display_position(pos,2)}
        --+---+---
      HEREDOC
      pos += 1
    end
  end

  def display_position(row,col)
    if row && col && !tic_tac_toe_state[row][col].nil?
      tic_tac_toe_state[row][col]
    else
      "-"
    end
  end

  # reset state
  def reset_board
    @tic_tac_toe_state = [[nil,nil,nil],[nil,nil,nil],[nil,nil,nil]]
  end

  # check for a winning play
  def check_winner
    row_winner?

    col_winner?

    diagonal_winner?
  end

  # check each row if there's a winner aka row win
  def row_winner?
    tic_tac_toe_state.each do |pos|
      if pos[0] == player && pos[1] == player && pos[2] == player
        puts 'Row Winner, resetting the board'
        reset_board
      end
    end
  end

  # check each column if there's a winner aka column win
  def col_winner?
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

  # Check for a diagonal winnerß
  def diagonal_winner?
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

