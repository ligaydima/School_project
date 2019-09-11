local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")
require("randomizers")

function check_answer()
	if (problem.x == 0 and answer == 2) or (problem.x == 106 and answer == 3 ) or (problem.x == -106 and answer == 1) then
		return true
	end
	return false
end

function restart ()
	SCORE = SCORE + 1
	showscore()
	problem.y = 0
	problem.x = 0
	math.randomseed(os.time())
	if TYPE == 1 then
		randomize_mul()
	end
end
function onUpdate( event )
	if problem.y> 350
		then
		if check_answer() then
			restart()
		else
			endGame()

		end

	else
		problem.y = problem.y + SPEED
	end
end
function endGame()
	Runtime:removeEventListener("enterFrame", onUpdate)
	composer.showOverlay("Scenes.result",
	{
		isModal = true,
		effect = "fade",
		time = 200,
	})
end

function showscore ()
	scoreText.text =scoreText.text:sub(0, scoreText.text:find(":")) .. tostring( SCORE )
end

function scene:create( event )
	local sceneGroup = self.view

	leftbutton = widget.newButton {
		onPress = function ( event )
			if problem.x > -106
			then
				problem.x = problem.x - 106;
			end
		end,
		top = 0,
		left = 10,
		width = 160,
		height = 480,
		labelColor = { default={1 - 215 / 255, 1 - 149 / 255, 1 - 71 / 255}, over={1 - 215 / 255, 1 - 149 / 255, 1 - 71 / 255 } },
	}
	leftbutton:setFillColor(20 / 255, 20 / 255, 20 / 255)

	rightbutton = widget.newButton {
		onPress = function ( event )
			if problem.x < 106
			then
				problem.x = problem.x + 106;
			end
		end,
		top = 0,
		left = 160,
		width = 160,
		height = 480,
		labelColor = { default={0}, over={0} },
	}
	rightbutton:setFillColor(20 / 255, 20 / 255, 20 / 255)
	sceneGroup:insert(leftbutton)
	sceneGroup:insert(rightbutton)

	scoreText = display.newText( "Очки: " .. tostring( SCORE ), 55, 0, font, 16)
	sceneGroup:insert(scoreText)


	box1 = display.newGroup()
	sceneGroup:insert(box1)

	box2 = display.newGroup()
	sceneGroup:insert(box2)

	box3 = display.newGroup()
	sceneGroup:insert(box3)

	problem = display.newGroup()

	display.setDefault("background", 20 / 255, 20 / 255, 20 / 255)


	b1 = display.newImageRect("ghost.png", 50, 50)
	b1.x = 53
	b1.y = 455
	box1:insert(b1)
	t1 = display.newText(0, 53, 430, font, 20)
	box1:insert(t1)

	b2 = display.newImageRect("ghost.png", 50, 50)
	b2.x = 159
	b2.y = 455
	box2:insert(b2)
	t2 = display.newText(0, 159, 430, font, 20)
	box2:insert(t2)

	b3 = display.newImageRect("ghost.png", 50, 50)
	b3.x = 265
	b3.y = 455
	box3:insert(b3)
	t3 = display.newText(0, 265, 430, font, 20)
	box3:insert(t3)

	ball = display.newImageRect( "pacman-D2_burned (1).png", 80, 80)
	ball.x = 160
	ball.y = 65
	problem:insert(ball)

	task = display.newText(problem, "", 160, 50, font, 20)
	task:setFillColor(0, 0, 1)


	sceneGroup:insert(problem)
end
function scene:show(event)
	local sceneGroup = self.view
	if event.phase == "did"
	then
		SCORE = -1
		restart()
		Runtime:addEventListener("enterFrame", onUpdate)
	end

end


scene:addEventListener("show", scene)
scene:addEventListener("create", scene)
return scene;
