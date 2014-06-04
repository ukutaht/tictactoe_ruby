require 'tic_tac_toe/gui_display'
describe TicTacToe::GUIDisplay do

  let(:runner) { double() }
  let(:display) { TicTacToe::GUIDisplay.new(runner, 600) }

  it 'handles mouse click' do
    expect(runner).to receive(:on_click)

    display.button_down(Gosu::MsLeft)
  end

  it 'handles y key' do
    expect(runner).to receive(:on_y_key)

    display.button_down(Gosu::KbY)
  end

  it 'handles n key' do
    expect(runner).to receive(:on_n_key)

    display.button_down(Gosu::KbN)
  end

  it 'draws text when game has not startet' do
    allow(runner).to receive(:collecting_players?).and_return(true)
       
    expect(display.text_font).to receive(:draw).with('Do you want to go first?(y/n)', 200, 300,0)
    display.draw
  end

  it 'draws winner message when game is over' do
    allow(runner).to receive(:collecting_players?).and_return(false)
    allow(runner).to receive(:show_results?).and_return(true)
    allow(runner).to receive(:winner_message).and_return("Chicken dinner")
       
    expect(display.text_font).to receive(:draw).with('Chicken dinner', 200, 300, 0)
    expect(display.text_font).to receive(:draw).with('Play again?(y/n)', 200, 400, 0)
    display.draw
  end
  
  it 'draws board during game' do
    allow(runner).to receive(:collecting_players?).and_return(false)
    allow(runner).to receive(:show_results?).and_return(false)
       
    expect(display).to receive(:draw_line).exactly(4).times
    expect(runner).to receive(:draw_marks).with(display)
    display.draw
  end

  it 'knwos how to draw one centered cell' do
    expect(display.mark_font).to receive(:draw).with("X", kind_of(Float), 0, 0)
    display.draw_cell("X", 0, 0)
  end
end
