require 'defaults'
require 'update'
require 'draw'

function love.load()
	set_ball()
	set_net()
	set_players()
	reset_score()
	sound_hit_low = love.audio.newSource("ball-hit.wav", "static")
	sound_hit_high = love.audio.newSource("ball-hit.wav", "static")
	font_size = window.h / 10
	love.graphics.setNewFont("gugi.ttf", font_size)
end

function love.update(dt)
	move_paddles()
	update_ball()
end

function love.draw()
	draw_net()
	draw_paddles()
	draw_ball()
	draw_scores()
end
