module TicTacToe
  class ComputerPlayer
    attr_reader :mark

    def initialize(mark: nil)
      @mark = mark
      @depth = 10 
    end

    def get_next_move(board, players)
     best_score = -Float::INFINITY
     best_index = nil

     board.valid_moves.shuffle.each do |index|
       score = -negamax(board.move(index: index, mark: self.mark),-1, players.rotate)
       best_score, best_index = score, index if score > best_score
     end

     return best_index
   end

   private

   def negamax(board,color, players,  depth=@depth)
     return color * get_score(board) if board.game_over? || depth == 0
     best_score = -Float::INFINITY

     board.valid_moves.each do |index|
       new_board = board.move(index: index, mark: players.first.mark)
       score = -negamax(new_board,-color, players.rotate, depth-1) 
       best_score = [best_score, score].max
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
