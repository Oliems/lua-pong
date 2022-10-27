-- Simple axis-aligned bounding box
function check_hitbox(x1, y1, w1, h1, x2, y2, w2, h2)
	return x1 < x2 + w2 and
		x2 < x1 + w1 and
		y1 < y2 + h2 and
		y2 < y1 + h1
end

-- Determine where the ball hit the paddle so that the angle
-- can be updated accordingly
function hit_position(player, ball)
	local precision = 20
	local slice = player.h / precision
	local hit_position = (player.y + player.h) - ball.y
	local dy = math.floor(precision / 2)
	for i = 0, precision + 1, 1 do
		if (hit_position >= i * slice and hit_position < (i + 1) * slice) then
			ball.dy = dy
		end
		dy = dy - 1
	end
end

-- Check for a collision between the ball and the paddle and update the ball
-- direction accordingly
function ball_paddle_collision(player, ball)
	if check_hitbox(player.x, player.y, player.w, player.h,
		ball.x, ball.y, ball.w, ball.h) then
		if ball_was_hit == false then
			ball.dx = -ball.dx * 2.5
			ball_was_hit = true
		else
			ball.dx = -ball.dx
		end
		love.audio.play(hit_sound)
		hit_position(player, ball)
		teleport_ball()
	end
end

-- Teleport the ball to avoid multiple collisions
function teleport_ball()
	if ball.dx > 0 then
		if (ball.x < player1.x) then
			ball.x = player1.x + player1.w
		end
	else
		if ball.x > player2.x then
			ball.x = player2.x - player2.w
		end
	end
end

-- Make the ball bounce on the top and bottom parts of the window
function ball_hit_wall()
	if ball.y <= 0 or ball.y >= window.h - ball.w then
		ball.dy = -ball.dy
	end
end
