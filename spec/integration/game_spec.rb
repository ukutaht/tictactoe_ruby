describe TicTacToe::Game do
  let(:board) { TicTacToe::Board.new }
  let(:io_string) { StringIO.new }
  let(:presenter) { TicTacToe::CLI_Presenter.new(io_string) }
  let(:player1) { double("player1", :mark => "X") }
  let(:player2) { double("player2", :mark => "O") }
  let(:computer1) {TicTacToe::ComputerPlayer.new(mark:"X")}
  let(:computer2) {TicTacToe::ComputerPlayer.new(mark:"O")}


  describe '#play' do
    it 'plays through the whole game' do
      allow(player1).to receive(:get_next_move).and_return(3, 8, 7)
      allow(player2).to receive(:get_next_move).and_return(4, 2, 6)
      game = TicTacToe::Game.new(players: [player1, player2], board: board, presenter: presenter) 
      
      game.play
      expect(io_string.string).to include("O has won!")
    end

    it 'computer vs computer is a draw' do
      game = TicTacToe::Game.new(players: [computer1, computer2], board: board, presenter: presenter)
     game.play
     expect(io_string.string).to include("It's a draw!")
    end
  end
end
