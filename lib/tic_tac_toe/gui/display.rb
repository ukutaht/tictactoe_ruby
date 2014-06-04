require 'gosu'
module TicTacToe
  class GUIDisplay < Gosu::Window
    attr_reader :width, :cell_width, :runner, :text_font, :mark_font, :game_state

    def initialize(runner, width)
      @width = width
      @cell_width = width / 3
      @runner = runner
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
      @game_state = runner.get_game_state
    end

    def button_down(id)
      case id
      when Gosu::KbQ 
        close
      when Gosu::MsLGUIRunnereft  
        runner.on_click(mouse_x, mouse_y)
      when Gosu::KbY
        runner.on_y_key
      when Gosu::KbN
        runner.on_n_key(self)
      end
    end


    def draw
      if @game_state == :pre_game
        text_font.draw("Who should go first?", 200, 200, 0)
        @player_goes_first_button.draw(200, 300, 0, 1, 1, Gosu::Color::RED)
        @computer_goes_first_button.draw(300, 300, 0, 1, 1, Gosu::Color::RED)
      elsif @game_state == :post_game
        text_font.draw(runner.winner_message, 200, 300, 0)
        text_font.draw("Play again?(y/n)", 200, 400, 0)
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
      runner.draw_marks(self)
    end
    
    def draw_cell(cell, x, y)
      mark_font.draw(cell, x + @mark_font.text_width(cell)/3, y, 0)
    end
  end
end
