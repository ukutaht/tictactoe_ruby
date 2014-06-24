require 'qt'

module TicTacToe
  module Qt_GUI
    class CellLabel < Qt::Label
      def initialize(index, parent)
        super(nil)
        @index = index
        @parent = parent
        self.frame_style = Qt::Frame::StyledPanel | Qt::Frame::Plain
        self.alignment = Qt::AlignCenter
        self.setSizePolicy(Qt::SizePolicy::MinimumExpanding, Qt::SizePolicy::MinimumExpanding)
        self.font = Qt::Font.new('Helvetica Neue', 60, 0)
      end


      def mousePressEvent(_)
        @parent.clicked(@index)
      end
    end
  end
end
