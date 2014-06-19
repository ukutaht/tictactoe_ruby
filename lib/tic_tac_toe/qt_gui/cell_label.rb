require 'qt'

module TicTacToe
  module Qt_GUI
    class CellLabel < Qt::Label
      def initialize(index, parent)
        super(nil)
        @index = index
        @parent = parent
      end

      def mousePressEvent(_)
        @parent.clicked(@index)
      end
    end
  end
end
