require 'gosu'
module TicTacToe
  class GUIDisplay < Gosu::Window
    attr_reader :width, :cell_width, :controllers, :current_controller, :text_font, :mark_font, :player_goes_first_button, :computer_goes_first_button

    def initialize(controllers, width)
      @width = width
      @cell_width = width / 3
      @controllers = controllers
      super(width, width, false)
      @player_goes_first_button = Gosu::Image.from_text(self, "Player", Gosu::default_font_name, 20)
      @computer_goes_first_button = Gosu::Image.from_text(self, "Computer", Gosu::default_font_name, 20)
      @mark_font = Gosu::Font.new(self, Gosu::default_font_name, cell_width)
      @text_font = Gosu::Font.new(self, Gosu::default_font_name, cell_width / 10)
    end

    def needs_cursor?
      true
    end

    def update
      @current_controller = controllers.find(&:appropriate?)
    end

    def button_down(id)
      case id
      when Gosu::KbQ 
        close
      when Gosu::MsLeft
        current_controller.on_click(mouse_x, mouse_y)
      when Gosu::KbY
        current_controller.on_y_key
      when Gosu::KbN
        current_controller.on_n_key(self)
      end
    end


    def draw
      current_controller.render_view(self)
    end

    def draw_grid
      [cell_width, cell_width*2].each do |coordinate|
        draw_line(coordinate, 0, Gosu::Color::WHITE, coordinate, width, Gosu::Color::WHITE)
        draw_line(0, coordinate, Gosu::Color::WHITE, width, coordinate, Gosu::Color::WHITE)
      end
    end

    def draw_cell(cell, x, y)
      mark_font.draw(cell, x + @mark_font.text_width(cell)/3, y, 0)
    end
  end
end
