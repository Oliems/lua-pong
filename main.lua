require 'src/defaults'
require 'src/menu'
require 'src/ball'
require 'src/collisions'
require 'src/interface'
require 'src/paddle'

function love.load()
	start_menu()
	initialize_game()
	font_small_size = window.h / 20
	font_regular_size = window.h / 10
	font_big_size = window.h / 5
	font_small = love.graphics.setNewFont("assets/gugi.ttf", font_small_size)
	font_regular = love.graphics.setNewFont("assets/gugi.ttf", font_regular_size)
	font_big = love.graphics.setNewFont("assets/gugi.ttf", font_big_size)
	hit_paddle = love.audio.newSource("assets/hit_paddle.wav", "static")
	hit_table = love.audio.newSource("assets/hit_table.wav", "static")
end

function love.update(dt)
	if not pause then
		move_paddles()
		update_ball()
		if player1.score >= 10 or player2.score >= 10 then
			reset_game()
		end
	end
end

function love.keypressed(key)
	if key == 'g' then pause = not pause end
end

function love.draw()
	draw_interface()
end
