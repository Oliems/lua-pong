function love.load()
	window = {}
	window.x = love.graphics.getPixelWidth()
	window.y = love.graphics.getPixelHeight()

	net = {}
	net.w = 10
	net.h = window.y
	net.x = (window.x - net.w) / 2
	net.y = 0

	player1 = {}
	player1.w = 10
	player1.h = 60
	player1.x = 2 * player1.w
	player1.y = (window.y - player1.h) / 2

	player2 = {}
	player2.w = 10
	player2.h = 60
	player2.x = window.x - (3 * player2.w)
	player2.y = (window.y - player2.h) / 2

	ball = {}
	ball.w = 10
	ball.h = 10
	ball.x = (window.x - ball.w) / 2
	ball.y = window.y / 2
	ball.dx = 5
	ball.dy = 3

	sound_hit_low = love.audio.newSource("ball-hit.wav", "static")
	sound_hit_high = love.audio.newSource("ball-hit.wav", "static")
end

function love.update(dt)
	if love.keyboard.isDown("o") then
		player1.y = player1.y - 15
	end
	if love.keyboard.isDown("p") then
		player1.y = player1.y + 15
	end

	if love.keyboard.isDown("q") then
		player2.y = player2.y - 15
	end
	if love.keyboard.isDown("w") then
		player2.y = player2.y + 15
	end

	ball.x = ball.x + ball.dx
	ball.y = ball.y + ball.dy
end

function love.draw()
	love.graphics.rectangle("fill", net.x, net.y, net.w, net.h)
	love.graphics.rectangle("fill", player1.x, player1.y, player1.w, player1.h)
	love.graphics.rectangle("fill", player2.x, player2.y, player2.w, player2.h)
	love.graphics.rectangle("fill", ball.x, ball.y, ball.w, ball.h)
end
