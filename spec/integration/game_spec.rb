describe TicTacToe::Game do
  let(:board) { [[" ", " ", " "],
                 [" ", " ", " "],
                 [" ", " ", " "]] }
  let(:presenter) { double("presenter") }
  let(:player1) { double("player1", :mark => "X") }
  let(:player2) { double("player2", :mark => "O") }

  let(:game) { TicTacToe::Game.new(players: [player1, player2], board: board, presenter: presenter) }

  describe '#play' do
    it 'does stuff' do
      allow(player1).to receive(:get_next_move).and_return([1, 0], [2, 2], [2, 1])
      allow(player2).to receive(:get_next_move).and_return([1, 1], [0, 2], [2, 0])

      expect(presenter).to receive(:announce_winner).with("O")

      game.play
    end
  end
end