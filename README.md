# lua-pong
A Pong clone made with Löve

https://www.ponggame.org/

# Features
## Interface
- Small paddles to reflect ping-pong paddles.
- Central dotted line.
- Score on each side of the line.

## Sound
- A low sound when the ball hits the center of the paddle.
- A higher sound when the ball hits the edge of the paddle.

## Gameplay
- Ball starts slow and is set to its final speed when it is hit for the first time.
- Ball must go fast enough so that each point does not take too long.
- Game ends when one of the player reach 10 points.
- A menu screen when launching the game with to choose the game mode.
- A splashscreen when the game ends.

## TODO
- Add a bit of randomness to the bouncing of the ball on the walls
- Add start menu
	- "Pong" drops from the top of the screen and bounce with ping pong ball sound
- Add end menu
- Bug :: ball.dy is not updated properly in hit_position() when game is in fullscreen or with higher res
