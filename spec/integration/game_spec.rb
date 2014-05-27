describe TicTacToe::Game do
  let(:board) { TicTacToe::Board.new }
  let(:player1) { double("player1", :mark => "X") }
  let(:player2) { double("player2", :mark => "O") }
  let(:computer1) {TicTacToe::ComputerPlayer.new(mark:"X")}
  let(:computer2) {TicTacToe::ComputerPlayer.new(mark:"O")}


  describe '#play' do
    it 'plays through the whole game' do
      io_string = StringIO.new("1\n1\n4\n5\n9\n3\n8\n7\n")
      allow(io_string).to receive(:puts)
      presenter = TicTacToe::CLI_Presenter.new(io_string) 
      game = TicTacToe::Game.new(board: board, presenter: presenter) 
      
      expect(io_string).to receive(:puts).with("O has won!")
      game.play
    end

    it 'computer vs computer is a draw' do
      io_string = StringIO.new("2\n2\n")
      allow(io_string).to receive(:puts)
      presenter = TicTacToe::CLI_Presenter.new(io_string) 
      game = TicTacToe::Game.new(board: board, presenter: presenter) 

      expect(io_string).to receive(:puts).with("It's a draw!")
      game.play
    end
  end
end
