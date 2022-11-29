require 'ruby2d'
GRID_SIZE = 20
GRID_WIDTH =Window.width/GRID_SIZE
GRID_HEIGHT=Window.height/GRID_SIZE
set background: 'navy'
set fps_cap: 20
class Snake
  attr_writer :direction

  def initialize
    @position = [[2, 0], [2, 1], [2, 2], [2, 3]]
    @direction = 'down'
  end

  def draw
    @position.each do |position|
      Square.new(x: position[0] * GRID_SIZE, y: position[1] * GRID_SIZE, size: GRID_SIZE - 1, color: 'white')
    end
  end

  def move
    @position.shift
    case @direction
    when 'down'
      @position.push(new_coords(head[0], head[1] + 1))
    when 'up'
      @position.push(new_coords(head[0], head[1] - 1))
    when 'left'
      @position.push(new_coords(head[0] - 1, head[1]))
    when 'right'
      @position.push(new_coords(head[0] + 1, head[1]))
    end
  end

  def can_change_direction_to?(new_direction)
    case @direction
    when 'up' then new_direction != 'down'
    when 'down' then new_direction != 'up'
    when 'left' then new_direction != 'right'
    when 'right' then new_direction != 'left'
    end
  end

  private

  def new_coords(x,y)
  [x%GRID_WIDTH, y%GRID_HEIGHT]
  end  

  def head
    @position.last
  end
end

snake = Snake.new
snake.draw

update do
  clear
  snake.move
  snake.draw
end

on :key_down do |event|
  snake.direction = event.key if %w[up down left right].include?(event.key) && snake.can_change_direction_to?(event.key)
end

show
