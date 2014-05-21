module TicTacToe
  class CLI_Presenter
    attr_reader :game
    attr_accessor :io_in, :io_out

    def initialize(game: nil, io_out: nil, io_in: nil)
      @game = game
      @io_out = io_out
      @io_in = io_in
    end

    def before_turn
      io_out.puts before_turn_string
    end

    def after_turn
      io_out.puts after_turn_string
    end

    def before_turn_string
      game.board.to_s
    end

    def after_turn_string
      game.board.to_s
    end

    def get_next_move
      sanitize_input(io_in.gets.chomp)
    end

    private

    def sanitize_input(str)
      (str.to_i - 1).divmod(game.board_size)
    end
  end
end
