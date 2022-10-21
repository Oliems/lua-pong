function draw_net()
	local i = 0
	local j = 1
	while i <= window.h do
		if j % 2 == 1 then
			love.graphics.rectangle("fill", net.x, i, net.w, net.h)
		end
		i = i + net.h
		j = j + 1
	end
end

function draw_paddles()
	love.graphics.rectangle("fill", player1.x, player1.y, player1.w, player1.h)
	love.graphics.rectangle("fill", player2.x, player2.y, player2.w, player2.h)
end

function draw_ball()
	love.graphics.rectangle("fill", ball.x, ball.y, ball.w, ball.h)
end
