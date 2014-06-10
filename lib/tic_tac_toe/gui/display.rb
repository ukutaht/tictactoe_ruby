require 'gosu'
module TicTacToe
  class GUIDisplay < Gosu::Window
    attr_reader :width, :cell_width 
    attr_accessor :controllers

    def initialize(width)
      @width = width
      super(width, width, false)
    end

    def needs_cursor?
      true
    end

    def update
      @current_controller = controllers.find(&:current?)
      @current_controller.update
    end

    def button_down(id)
      case id
      when Gosu::KbQ 
        close
      when Gosu::MsLeft
        @current_controller.on_click(mouse_x, mouse_y)
      end
    end

    def draw
      @current_controller.render_view
    end
  end
end
