require 'ruby2d'

set width: 640
set height: 480

image.new('nedladdning.gif')

square = square.new(
    color: 'red',
    x: 40,
    y: 10,
    width: 100,
    height: 100,
)

on :key_held do |event|
    case event.key
    when 'up'
        square.y -= 5
    when 'down'
        square.y += 5
    when 'left'
        square.x -= 5
    when 'right'
        square.x += 5
    end
show