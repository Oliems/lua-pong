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

function check_hitbox(x1, y1, w1, h1, x2, y2, w2, h2)
	return x1 < x2 + w2 and
		x2 < x1 + w1 and
		y1 < y2 + h2 and
		y2 < y1 + h1
end

function check_collisions()
	if ball.y < 0 or ball.y > window.h - ball.w then
		ball.dy = -ball.dy
	end
	if check_hitbox(player1.x, player1.y, player1.w, player1.h,
		ball.x, ball.y, ball.w, ball.h) then
		ball.dx = -ball.dx
	end
	if check_hitbox(player2.x, player2.y, player2.w, player2.h,
		ball.x, ball.y, ball.w, ball.h) then
		ball.dx = -ball.dx
	end
end

function hit_position(player, ball)

end
function update_ball()
	check_collisions()
	local hit_position = (player2.y + player2.h) - ball.h
	if (hit_position >= 0 and hit_position < 7) then
		ball.dy = 4
	end

	if (hit_position >= 7 and hit_position < 14) then
		ball.dy = 3
	end

	if (hit_position >= 14 and hit_position < 21) then
		ball.dy = 2
	end

	if (hit_position >= 21 and hit_position < 28) then
		ball.dy = 1
	end

	if (hit_position >= 28 and hit_position < 32) then
		ball.dy = 0
	end

	if (hit_position >= 32 and hit_position < 39) then
		ball.dy = -1
	end

	if (hit_position >= 39 and hit_position < 46) then
		ball.dy = -2
	end

	if (hit_position >= 46 and hit_position < 53) then
		ball.dy = -3
	end

	if (hit_position >= 53 and hit_position <= 60) then
		ball.dy = -4
	end
	ball.x = ball.x + ball.dx
	ball.y = ball.y + ball.dy
	if ball.x > window.w then
		set_ball()
		player1.score = player1.score + 1
		ball.dx = -ball.dx
	end
	if ball.x < 0 then
		set_ball()
		player2.score = player2.score + 1
	end
end
