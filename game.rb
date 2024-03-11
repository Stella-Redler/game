require 'ruby2d';

width = 640
height = 480

Image.new('Adventures of Pip.png.jfif');

hooded = Sprite.new(
    'Hooded.png',
    x: 200, y: 0, z: 5,
    width: 103,
    height: 103,
    clip_width: 103,
    time: 200,
    animations: {
        idle: 0..1,
        walk: 2..5,
    }
)

on :key_held do |event|
    case event.key
        when 'w'
            hooded.y -= 5
        when 's'
            hooded.y += 5
        when 'a'
            hooded.x -= 5
        when 'd'
            hooded.x += 5
    end
end

show