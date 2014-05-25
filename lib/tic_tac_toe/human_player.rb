module TicTacToe
  class HumanPlayer
    attr_reader :mark
    def initialize(mark: nil, presenter: nil)
      @mark = mark
      @presenter = presenter
    end

    def get_next_move(*)
      @presenter.get_next_move
    end
  end
end