-- TODO Set ball speed to be a fraction of paddle movement speed

function love.load()
	window = {}
	window.w = love.graphics.getPixelWidth()
	window.h = love.graphics.getPixelHeight()

	net = {}
	net.w = window.w / 80
	net.h = window.h
	net.x = (window.w - net.w) / 2
	net.y = 0

	paddle = {}
	paddle.w = window.w / 80
	paddle.h = window.h / 10
	paddle.y = (window.h - paddle.h) / 2
	paddle.dy = window.h / 40

	player1 = {}
	player1.w = paddle.w
	player1.h = paddle.h
	player1.x = 2 * player1.w
	player1.y = paddle.y
	player1.dy = paddle.dy

	player2 = {}
	player2.w = paddle.w
	player2.h = paddle.h
	player2.x = window.w - (3 * player2.w)
	player2.y = paddle.y
	player2.dy = paddle.dy

	ball = {}
	ball.w = window.w / 100
	ball.h = ball.w
	ball.x = (window.w - ball.w) / 2
	ball.y = window.h / 2
	ball.dx = 5
	ball.dy = 3

	sound_hit_low = love.audio.newSource("ball-hit.wav", "static")
	sound_hit_high = love.audio.newSource("ball-hit.wav", "static")
end

function move_paddles()
	if love.keyboard.isDown("q") then
		if player1.y > paddle.dy then
			player1.y = player1.y - paddle.dy
		end
	end
	if love.keyboard.isDown("w") then
		if player1.y < window.h - paddle.h - paddle.dy then
			player1.y = player1.y + paddle.dy
		end
	end

	if love.keyboard.isDown("o") then
		if player2.y > paddle.dy then
			player2.y = player2.y - paddle.dy
		end
	end
	if love.keyboard.isDown("p") then
		if player2.y < window.h - paddle.h - paddle.dy then
			player2.y = player2.y + paddle.dy
		end
	end
end

function check_collisions()

end

function love.update(dt)
	move_paddles()
	ball.x = ball.x + ball.dx
	ball.y = ball.y + ball.dy
end

function love.draw()
	love.graphics.rectangle("fill", net.x, net.y, net.w, net.h)
	love.graphics.rectangle("fill", player1.x, player1.y, player1.w, player1.h)
	love.graphics.rectangle("fill", player2.x, player2.y, player2.w, player2.h)
	love.graphics.rectangle("fill", ball.x, ball.y, ball.w, ball.h)
end
