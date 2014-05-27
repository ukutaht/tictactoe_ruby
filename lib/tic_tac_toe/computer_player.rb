module TicTacToe
  class ComputerPlayer
    attr_reader :mark, :transpositon_table

    def initialize(mark: nil)
      @mark = mark
      @depth = 10 
      @transposition_table = {}
    end

    def get_next_move(board, players)
     best_score = -Float::INFINITY
     best_index = nil

     board.valid_moves.shuffle.each do |index|
       score = -negamax(board.move(index, self.mark), -1, players.rotate, -Float::INFINITY, Float::INFINITY)
       best_score, best_index = score, index if score > best_score
     end

     return best_index
   end

   private

   def negamax(board, color, players, alpha, beta, depth=@depth)
     alpha_orig = alpha
     
     if tt_entry = @transposition_table[board.to_sym]
       if tt_entry[:depth] >= depth
         if tt_entry[:flag] == :exact
           return tt_entry[:score]
         elsif tt_entry[:flag] == :lower
           alpha = [alpha, tt_entry[:score]].max
         elsif tt_entry[:flag] == :upper
           beta = [beta, tt_entry[:score]].min
         end
         if alpha >= beta
           return tt_entry[:score]
         end
       end
     else
       tt_entry = {}
     end
     

     return color * get_score(board) if board.game_over? || depth == 0
     best_score = -Float::INFINITY

     board.valid_moves.each do |index|
       new_board = board.move(index, players.first.mark)
       score = -negamax(new_board,-color, players.rotate,-beta, -alpha, depth-1) 
       best_score = [best_score, score].max
       alpha = [best_score, alpha].max
       break if alpha >= beta
     end

     tt_entry[:score] = best_score
     if best_score <= alpha_orig
       tt_entry[:flag] = :upper
     elsif best_score >= beta
       tt_entry[:flag] = :lower
     else
       tt_entry[:flag] = :exact
     end
     tt_entry[:depth] = depth
     board.rotations.each do |rotated|
       @transposition_table[rotated.to_sym] = tt_entry
     end


     return best_score 
   end

   def get_score(board)
     return 0 if board.draw?
     return 1 if board.winner == self.mark 
     -1
   end
  end
end
