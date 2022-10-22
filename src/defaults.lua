window = {}
window.w = love.graphics.getPixelWidth()
window.h = love.graphics.getPixelHeight()

paddle = {}
paddle.w = window.w / 80
paddle.h = window.h / 7
paddle.y = (window.h - paddle.h) / 2
paddle.dy = window.h / 50

ball = {}
function set_ball()
	ball_was_hit = false
	ball.w = window.w / 80
	ball.h = ball.w
	ball.x = (window.w - ball.w) / 2
	ball.y = window.h / 2
	ball.dx = window.h / 150
	ball.dy = math.random(-4, 4)
end

net = {}
function set_net()
	net.w = window.w / 80
	net.h = 2 * ball.w
	net.x = (window.w - net.w) / 2
	net.y = 0
end

player1 = {}
player2 = {}
function set_players()
	-- Player 1 is on the left of the screen
	player1.w = paddle.w
	player1.h = paddle.h
	player1.x = 2 * player1.w
	player1.y = paddle.y
	player1.dy = paddle.dy

	-- Player 2 is on the right of the screen
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

function initialize_game()
	set_ball()
	set_net()
	set_players()
	reset_score()
end

function reset_game()
	set_ball()
	set_players()
	reset_score()
end
