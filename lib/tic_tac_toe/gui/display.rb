require 'gosu'
require 'ruby-prof'

module TicTacToe
  class GUIDisplay < Gosu::Window
    attr_reader :width, :cell_width 
    attr_accessor :controllers

    def initialize(width)
      @width = width
      @click_coordinates = []
      @updating = false
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
        if !@updating
          @updating = true
          @current_controller.on_click(mouse_x, mouse_y)
        end
      end
    end

    def update
      @current_controller = controllers.find(&:current?)
      if !@updating
        @current_controller.update([])
      end


      @updating = false
    end

    def draw
      @current_controller.render_view
    end

  end
end
