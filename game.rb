require 'ruby2d';

width = 640
height = 480

Image.new('Adventures of Pip.png.jfif');


hooded = Sprite.new(
    'Hooded_emotes.png',
    x: 10, y: 260, z: 5,
    width: 80,
    height: 80,
    clip_width: 68,
    time: 200,
    animations: {
        walk: 0..3,
        run: 4..11, 
        jump: 12..18,
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
            hooded.y += -8
            hooded.play animation: :jump
        when 'right'
            hooded.x += 1.5
            hooded.play animation: :run
        when 'left'
            hooded.x -= 1.5
            hooded.play animation: :run, flip: :horizontal
    end
end

arrayY = 0

update do
    if hooded.y < arrayY
        hooded.y += 60/(arrayY[hooded.x] - hooded.y + 0.1)
    end
    if hooded.y > arrayY[hooded.x]
        hooded.y = arrayY[hooded.x]
    end
end

show