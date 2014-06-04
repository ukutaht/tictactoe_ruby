require 'tic_tac_toe/cli_display'

describe TicTacToe::CLIDisplay do
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:display) { TicTacToe::CLIDisplay.new(input, output) }

  it 'gets move from stdin' do
    input.string = "3\n"

    expect(display.prompt_move).to eq "3" 
    expect(display.output.string).to match /move/
  end

  it 'prompts if user should go first' do
    input.string = "y\n"

    expect(display.prompt_if_user_goes_first).to eq 'y'
    expect(display.output.string).to match /go first?/
  end

  it 'shows invalid move message' do
    display.invalid_input_message

    expect(display.output.string).to match /Invalid/
  end

  it 'prompts to play again' do
    display.input.string = "y"
    
    expect(display.prompt_to_play_again).to eq 'y'
    expect(display.output.string).to match /play again?/
  end

  it 'shows the board' do
    display.show_board("XXXOOOXXX")

    expect(display.output.string.count("X")).to eq 6
    expect(display.output.string.count("O")).to eq 3
  end

  it 'displays numbers for empty squares' do
    display.show_board("X XO OXXX")

    expect(display.output.string).to include '2'
    expect(display.output.string).to include '5'
  end

  it 'clears the screen before showing board' do
    display.show_board("")
    expect(display.output.string).to include "\e[H\e[2J"
  end

end
