-- TODO Set ball speed to be a fraction of paddle movement speed

player1 = {}
player2 = {}
paddle = {}
window = {}
ball = {}
net = {}

window.w = love.graphics.getPixelWidth()
window.h = love.graphics.getPixelHeight()

paddle.w = window.w / 80
paddle.h = window.h / 10
paddle.y = (window.h - paddle.h) / 2
paddle.dy = window.h / 30

function set_ball()
	ball.w = window.w / 80
	ball.h = ball.w
	ball.x = (window.w - ball.w) / 2
	ball.y = window.h / 2
	ball.dx = window.h / 150
	ball.dy = window.w / window.w
end

function set_net()
	net.w = window.w / 80
	net.h = 2 * ball.w
	net.x = (window.w - net.w) / 2
	net.y = 0
end

function set_players()
	player1.w = paddle.w
	player1.h = paddle.h
	player1.x = 2 * player1.w
	player1.y = paddle.y
	player1.dy = paddle.dy

	player2.w = paddle.w
	player2.h = paddle.h
	player2.x = window.w - (3 * player2.w)
	player2.y = paddle.y
	player2.dy = paddle.dy
end

function reset_score()
player1.score = 0
player2.score = 0
end
