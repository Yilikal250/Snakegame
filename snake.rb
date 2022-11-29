require 'ruby2d'
GRID_SIZE = 20

class Snake
  def initialize
    @position = [[2, 0], [2, 1], [2, 2], [2, 3]]
  end

  def draw
    @position.each do |position|
      Square.new(x: position[0] * GRID_SIZE, y: position[1] * GRID_SIZE, size: GRID_SIZE - 1, color: 'white')
    end
  end
end

snake = Snake.new
snake.draw
show
