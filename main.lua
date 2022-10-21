
require 'defaults'
require 'draw'
require 'update'

function love.load()
	set_ball()
	set_net()
	set_players()

	sound_hit_low = love.audio.newSource("ball-hit.wav", "static")
	sound_hit_high = love.audio.newSource("ball-hit.wav", "static")
end

function love.update(dt)
	move_paddles()
	update_ball()
end

function love.draw()
	draw_net()
	draw_paddles()
	draw_ball()
end
