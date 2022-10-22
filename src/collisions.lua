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
	local hit_position = (player.y + player.h) - ball.h
	if (hit_position >= 0 and hit_position < 7) then
		ball.dy = ball.dy * hit_position
	end
	if (hit_position >= 7 and hit_position < 14) then
		ball.dy = ball.dy * hit_position
	end
	if (hit_position >= 14 and hit_position < 21) then
		ball.dy = ball.dy * hit_position
	end
	if (hit_position >= 21 and hit_position < 28) then
		ball.dy = ball.dy * hit_position
	end
	if (hit_position >= 28 and hit_position < 32) then
		ball.dy = 0
	end
	if (hit_position >= 32 and hit_position < 39) then
		ball.dy = ball.dy * hit_position
	end
	if (hit_position >= 39 and hit_position < 46) then
		ball.dy = ball.dy * hit_position
	end
	if (hit_position >= 46 and hit_position < 53) then
		ball.dy = ball.dy * hit_position
	end
	if (hit_position >= 53 and hit_position <= 60) then
		ball.dy = ball.dy * hit_position
	end
end

-- TODO Teleport the ball to avoid multi-collision bug
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
	end
end

-- Make the ball bounce on the top and bottom parts of the window
function ball_hit_wall()
	if ball.y < 0 or ball.y > window.h - ball.w then
		ball.dy = -ball.dy
	end
end
