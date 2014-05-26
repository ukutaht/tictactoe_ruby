describe TicTacToe::Game do
  let(:board) { TicTacToe::Board.new }
  let(:io_string) { StringIO.new }
  let(:presenter) { TicTacToe::CLI_Presenter.new(io: io_string) }
  let(:player1) { double("player1", :mark => "X") }
  let(:player2) { double("player2", :mark => "O") }

  let(:game) { TicTacToe::Game.new(players: [player1, player2], board: board, presenter: presenter) }

  describe '#play' do
    it 'does stuff' do
      allow(player1).to receive(:get_next_move).and_return(3, 8, 7)
      allow(player2).to receive(:get_next_move).and_return(4, 2, 6)
      
      game.play
      expect(io_string.string).to include("O has won!")
    end

    it 'computer vs computer is a draw' do
    end
  end
end
