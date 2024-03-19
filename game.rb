require 'ruby2d';

width = 640
height = 480

Image.new('Adventures of Pip.png.jfif');

hooded = Sprite.new(
    'Hooded.png',
    x: 10, y: 245, z: 5,
    width: 80,
    height: 80,
    clip_width: 55,
    time: 200,
    animations: {
        idle: 0..1,
        walk: 2..5,
        run: 6..14, 
        jump: 15..22,
    }
)

on :key_held do |event|
    case event.key
        when 'a'
            hooded.x -= 1
            hooded.play flip: :horizontal, animation: :walk
        when 'd'
            hooded.x += 1
            hooded.play animation: :walk
        when 'space'
            hooded.y += -1
            hooded.play animation: :jump
        when 'right'
            hooded.x += 1.5
            hooded.play animation: :run
        when 'left'
            hooded.x -= 1.5
            hooded.play animation: :run, flip: :horizontal
    end
end

show