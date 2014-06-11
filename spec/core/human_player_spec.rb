require 'tic_tac_toe/core/human_player'
require 'tic_tac_toe/core/board'

describe TicTacToe::Core::HumanPlayer do
  let(:board) { TicTacToe::Core::Board.new }
  let(:player) { TicTacToe::Core::HumanPlayer.new("X") }

  it 'makes a move if index is valid' do
    player.make_move(board, 1)
    
    expect(board.char_at(1)).to eq "X"
  end

  it 'returns truthy value if move was made' do
    expect(player.make_move(board, 1)).to be_truthy
  end

  it 'does not make a move if move is invalid' do
    player.make_move(board, 1000)
    
    expect(board).to be_empty
  end

  it'returns falsey value if move was not made' do
    expect(player.make_move(board, 1000)).to be_falsey
  end
end

