require 'ruby2d';

width = 640
height = 400

Image.new('Adventures of Pip.png.jfif');
$lives = 400

restart_text = Text.new(
    'press "return" to restart',
    x: 200, y: 200, z: -1,
    color: 'white',
)

game_over = Image.new(
    'game_over.png',
    x: 0, y: 0, z: -1,
    width: 640,
    height: 400,
)

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

shrooms = Sprite.new(
    'shrooms.png',
    x: 275, y: 295, z: 6,
    width: 55,
    height: 55,
    clip_width: 177,
    time: 300,
    animations: {
        attack: 1..4,
    }
)

$heart1 = Sprite.new(
    'heart.png',
    x: 30, y: 430, z: 6,
    width: 30,
    height: 30,
)

$heart2 = Sprite.new(
    'heart.png',
    x: 60, y: 430, z: 6,
    width: 30,
    height: 30,
)

$heart3 = Sprite.new(
    'heart.png',
    x: 90, y: 430, z: 6,
    width: 30,
    height: 30,
)

arrayY = [260, 255, 250, 245, 235, 235, 235, 280, 280, 280, 280, 280, 280, 280, 235, 235, 235, 235, 235, 235, 235, 170, 170, 170, 175, 180, 185, 235, 235, 235, 235, 235, 235]
jumping = false
jump_height = 60
jump_speed = 5

on :key_held do |event|
    case event.key
    when 'a'
        hooded.x -= 1
        hooded.play flip: :horizontal, animation: :walk
    when 'd'
        hooded.x += 1
        hooded.play animation: :walk
    when 'space'
        unless jumping
            jumping = true
            hooded.play animation: :jump
    end
    when 'right'
        hooded.x += 1.5
        hooded.play animation: :run
    when 'left'
        hooded.x -= 1.5
        hooded.play animation: :run, flip: :horizontal
    when 'return'
        game_over.z = -1
        restart_text.z = -1
        $lives = 400
        hooded.x = 10
    end
end

def update_lives
    if $lives > 300
        $heart1.add
        $heart2.add
        $heart3.add
    elsif $lives > 200
        $heart1.add
        $heart2.add
        $heart3.remove
    elsif $lives > 100
        $heart1.add
        $heart2.remove
        $heart3.remove
    elsif $lives > 0
        $heart1.remove
        $heart2.remove
        $heart3.remove
    end
end

update do
    update_lives
    platform_index = [(hooded.x / 640.0 * 33).to_i, arrayY.length - 1].min
    target_y = arrayY[platform_index]
    if jumping
        hooded.y -= jump_speed
        if hooded.y <= target_y - jump_height
            jumping = false
        end
    else
        if hooded.y < target_y
            hooded.y += 1
        elsif hooded.y > target_y
            hooded.y = target_y
        end
    end
    if hooded.x >= 240 && hooded.x <= 270 && hooded.y >= 260
        shrooms.play animation: :attack
        hooded.color.opacity = 0.5
        $lives -= 2
        loop = true
    else
        shrooms.stop
        hooded.color.opacity = 1
    end
    if $lives < 0
        game_over.z = 15
        restart_text.z = 15
    end
end

show