require 'src/defaults'
require 'src/ball'
require 'src/collisions'
require 'src/interface'
require 'src/paddle'

function love.load()
	initialize_game()
	font_size = window.h / 10
	love.graphics.setNewFont("assets/gugi.ttf", font_size)
	hit_sound = love.audio.newSource("assets/ball-hit.wav", "static")
end

function love.update(dt)
	move_paddles()
	update_ball()
	if player1.score >= 10 or player2.score >= 10 then
		reset_game()
	end
end

function love.draw()
	draw_interface()
end
