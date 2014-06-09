module TicTacToe
  module Core
    class ComputerPlayer
      attr_reader :mark, :transpositon_table

      def initialize(mark)
        @mark = mark
        @depth = 7
      end

      def human?
        false
      end

      def make_move(board, _index)
        move = get_next_move(board)
        board.move!(move, self.mark)
      end

      def get_next_move(board)
       best_score = -Float::INFINITY
       best_index = nil
       players = ['X', 'O'].unshift(mark).uniq

       board.valid_moves.shuffle.each do |index|
         score = -negamax(board.move(index, self.mark), players.rotate, -Float::INFINITY, Float::INFINITY)
         best_score, best_index = score, index if score > best_score
       end

       return best_index
     end

     private

     def negamax(board, players, alpha, beta, depth=@depth)
       return get_score(board, players.first) if board.game_over? || depth == 0
       best_score = -Float::INFINITY

       board.valid_moves.each do |index|
         new_board = board.move(index, players.first)
         score = -negamax(new_board, players.rotate,-beta, -alpha, depth-1) 
         best_score = [best_score, score].max
         alpha = [best_score, alpha].max
         break if alpha >= beta
       end

       return best_score 
     end

     def get_score(board, mark)
       return 0 if board.draw?
       return 1 if board.winner == mark 
       -1
     end
    end
  end
end
