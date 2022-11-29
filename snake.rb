require 'ruby2d'
GRID_SIZE = 20
set background: 'navy'
set fps_cap: 1
class Snake
  def initialize
    @position = [[2, 0], [2, 1], [2, 2], [2, 3]]
    @direction='down'   
  end

  def draw
    @position.each do |position|
      Square.new(x: position[0] * GRID_SIZE, y: position[1] * GRID_SIZE, size: GRID_SIZE - 1, color: 'white')
    end
  end

  def move
  case @direction
  when 'down'
    @position.shift
  end    
  end  
end

snake = Snake.new
snake.draw

update do
clear
snake.move
snake.draw
end    
show
