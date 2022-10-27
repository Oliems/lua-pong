function move_paddles()
	if love.keyboard.isDown("q") then
		if player1.y > paddle.dy then
			player1.y = player1.y - paddle.dy
		end
	end
	if love.keyboard.isDown("s") then
		if player1.y < window.h - paddle.h - paddle.dy then
			player1.y = player1.y + paddle.dy
		end
	end

	if love.keyboard.isDown("p") then
		if player2.y > paddle.dy then
			player2.y = player2.y - paddle.dy
		end
	end
	if love.keyboard.isDown("l") then
		if player2.y < window.h - paddle.h - paddle.dy then
			player2.y = player2.y + paddle.dy
		end
	end
end
