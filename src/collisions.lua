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
	local hit_position = (player.y + player.h) - ball.y
	local slice = player.h / 9
	if (hit_position >= 0 and hit_position < slice) then
		ball.dy = 6
	end
	if (hit_position >= slice and hit_position < 2 * slice) then
		ball.dy = 4
	end
	if (hit_position >= 2 * slice and hit_position < 3 * slice) then
		ball.dy = 2
	end
	if (hit_position >= 3 * slice and hit_position < 4 * slice) then
		ball.dy = 1
	end
	if (hit_position >= 4 * slice and hit_position < 5 * slice) then
		ball.dy = 0
	end
	if (hit_position >= 5 * slice and hit_position < 6 * slice) then
		ball.dy = -1
	end
	if (hit_position >= 6 * slice and hit_position < 7 * slice) then
		ball.dy = -2
	end
	if (hit_position >= 7 * slice and hit_position < 8 * slice) then
		ball.dy = -4
	end
	if (hit_position >= 8 * slice and hit_position <= 9 * slice) then
		ball.dy = -6
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
