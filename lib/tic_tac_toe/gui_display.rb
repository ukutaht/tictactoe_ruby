require 'gosu'
module TicTacToe
  class GUIDisplay < Gosu::Window
    attr_reader :width, :cell_width, :presenter, :font
    def initialize(presenter, width)
      @width = width
      @cell_width = width / 3
      @presenter = presenter
      super(width, width, false)
      @mark_font = Gosu::Font.new(self, Gosu::default_font_name, cell_width)
      @text_font = Gosu::Font.new(self, Gosu::default_font_name, cell_width / 10)
    end

    def needs_cursor?
      true
    end

    def button_down(id)
      case id
      when Gosu::KbQ 
        close
      when Gosu::MsLeft  
        presenter.on_click(mouse_x, mouse_y)
      when Gosu::KbY
        presenter.on_y_key
      when Gosu::KbN
        presenter.on_n_key(self)
      end
    end


    def draw
      if presenter.collecting_players?
        @text_font.draw("Do you want to go first?(y/n)", 200, 300, 0)
      elsif presenter.show_results?
        @text_font.draw(presenter.winner_message, 200, 300, 0)
        @text_font.draw("Play again?(y/n)", 200, 400, 0)
      else
        draw_grid
        draw_marks
      end
    end

    def draw_grid
      [cell_width, cell_width*2].each do |coordinate|
        draw_line(coordinate, 0, Gosu::Color::WHITE, coordinate, width, Gosu::Color::WHITE)
        draw_line(0, coordinate, Gosu::Color::WHITE, width, coordinate, Gosu::Color::WHITE)
      end
    end

    def draw_marks
      presenter.draw_marks(self)
    end
    
    def draw_cell(cell, x, y)
      @mark_font.draw(cell, x + @mark_font.text_width(cell)/3, y, 0)
    end
  end
end
