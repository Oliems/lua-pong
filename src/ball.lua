function update_ball()
	ball_hit_wall()
	ball_paddle_collision(player1, ball)
	ball_paddle_collision(player2, ball)
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
