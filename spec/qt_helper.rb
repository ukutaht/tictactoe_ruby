require 'qt'

RSpec::Matchers.define :have_label do |expected|
  match do |widget|
    widget.find_children(Qt::Label).any?{|l| l.text == expected}
  end
end

RSpec::Matchers.define :have_cell do |expected|
  match do |widget|
    widget.find_children(TicTacToe::Qt_GUI::CellLabel).any?{|l| l.text == expected}
  end
end

def find_widget(name)
  window.find_child(Qt::Widget, name)
end
