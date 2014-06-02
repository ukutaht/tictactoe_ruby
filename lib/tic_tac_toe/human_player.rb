module TicTacToe
  class HumanPlayer
    attr_reader :mark
    def initialize(presenter, marlk)
      @mark = mark
      @presenter = presenter
    end

    def get_next_move(*)
      @presenter.get_next_move
    end
  end
end
