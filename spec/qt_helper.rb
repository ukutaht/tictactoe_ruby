require 'qt'

RSpec::Matchers.define :have_label do |expected|
  match do |widget|
    widget.find_children(Qt::Label).any?{|l| l.text == expected}
  end
end

def find_widget(name)
  window.find_child(Qt::Widget, name)
end
