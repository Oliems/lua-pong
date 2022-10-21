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

function update_ball()
	ball.x = ball.x + ball.dx
	ball.y = ball.y + ball.dy
	if ball.x > window.w then
		set_ball()
	end
end

function check_collisions()

end
