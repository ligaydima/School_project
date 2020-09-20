local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")
require("randomizers")

local is_pause = 0;
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
			if (SCORE == 4) then pausetext.text = "ZA WARUDOO"
			end
			restart()
		else
			endGame()
		end

	else
		if (is_pause == 0) then
		problem.y = problem.y + speed
		end
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
	scoreText.text = scoreText.text:sub(0, scoreText.text:find(":")) .. tostring( SCORE )
end
function resume ()
	is_pause = 0
    pausetext.isVisible = false;
	resumebutton:setEnabled(0)
	resumebutton.isVisible = false
end
function scene:create( event )
	local sceneGroup = self.view
	resumebutton = widget.newButton {
		onPress = resume,
		top = 0,
		left = 0,
		width = display.contentWidth,
		height = display.contentHeight,
		alpha = 1,
	}
    local options_pausetext = {
        text = "Пауза. Нажми на любое место на экране, чтобы продолжить",
        x = display.contentCenterX,
        y = display.contentCenterY,
        width = 120,
        font = font,
        fontSize = 20,
        align = "center",
    }
    pausetext = display.newText(options_pausetext)
    -- pausetext:setFillColor(0, 0, 1)
    pausetext.isVisible = false
	resumebutton.isVisible = false;
	local pausebutton = widget.newButton {
		onPress = function ( event )
			is_pause = 1
			resumebutton.isVisible = true
			resumebutton:setEnabled(1)
            pausetext.isVisible = true
		end,
		defaultFile = "Images/pause_button.png",
		top = 0,
		left = display.contentWidth - 50,
		width = 50,
		height = 50,
		fillColor = { default={ 1, 0.2, 0.5, 0.7 }, over={ 1, 0.2, 0.5, 1 } },
		labelColor = { default={0}, over={0} },
	}
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
		alpha = 1,
		labelColor = { default={1 - 215 / 255, 1 - 149 / 255, 1 - 71 / 255}, over={1 - 215 / 255, 1 - 149 / 255, 1 - 71 / 255 } },
	}
	leftbutton:setFillColor(20 / 255, 20 / 255, 20 / 255)
	resumebutton:setFillColor(20 / 255, 20 / 255, 20 / 255)

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
		alpha = 1,
		labelColor = { default={0}, over={0} },
	}
	rightbutton:setFillColor(20 / 255, 20 / 255, 20 / 255)
	sceneGroup:insert(leftbutton)
	sceneGroup:insert(rightbutton)
	sceneGroup:insert(pausebutton)

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


	b1 = display.newImageRect("Images/ghost.png", 50, 50)
	b1.x = 53
	b1.y = 455
	box1:insert(b1)
	t1 = display.newText(0, 53, 430, font, 20)
	box1:insert(t1)

	b2 = display.newImageRect("Images/ghost.png", 50, 50)
	b2.x = 159
	b2.y = 455
	box2:insert(b2)
	t2 = display.newText(0, 159, 430, font, 20)
	box2:insert(t2)

	b3 = display.newImageRect("Images/ghost.png", 50, 50)
	b3.x = 265
	b3.y = 455
	box3:insert(b3)
	t3 = display.newText(0, 265, 430, font, 20)
	box3:insert(t3)

	ball = display.newImageRect( "Images/pacmans/"..players[choice]..".png", 80, 80)
	ball.x = 160
	ball.y = 65
	problem:insert(ball)

	task = display.newText(problem, "", 160, 50, font, 20)
	task:setFillColor(0, 0, 1)


	sceneGroup:insert(problem)

	sceneGroup:insert(resumebutton)
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
