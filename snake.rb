require 'ruby2d'
GRID_SIZE = 20
set background: 'navy'
set fps_cap: 20
class Snake
    attr_writer :direction
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
  @position.shift  
  case @direction
  when 'down'
    @position.push([head[0],head[1]+1])
  when'up'  
    @position.push([head[0],head[1]-1])
  when'left'  
    @position.push([head[0]-1,head[1]])  
  when'right'  
    @position.push([head[0]+1,head[1]])    
  end    
  end 
  def can_change_direction_to?(new_direction)
   case @direction
   when 'up' then new_direction != 'down'
   when 'down' then new_direction !='up'
   when 'left' then new_direction != 'right'
   when 'right' then new_direction !='left'
   end     
  end  
   private
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
    if ['up','down','left','right'].include?(event.key)
    if snake.can_change_direction_to?(event.key)
    snake.direction=event.key
    end
    end 
end   

show
