require 'gosu'
module TicTacToe
  class GUIDisplay < Gosu::Window
    attr_reader :width, :cell_width 
    attr_accessor :controllers

    def initialize(width)
      @width = width
      @click_coordinates = []
      super(width, width, false)
    end

    def needs_cursor?
      true
    end

    def button_down(id)
      case id
      when Gosu::KbQ 
        close
      when Gosu::MsLeft
        @click_coordinates = [mouse_x, mouse_y]
      end
    end

    def update
      @current_controller = controllers.find(&:current?)
      @current_controller.update(@click_coordinates)
      @click_coordinates = []
    end

    def draw
      @current_controller.render_view
    end

  end
end
