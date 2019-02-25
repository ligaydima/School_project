local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")
function scene:create( event )
	print(1)
	local sceneGroup = self.view
	x = math.random(1, 9)
	y = math.random(1, 9)
	

	box1 = display.newGroup()
	sceneGroup:insert(box1)

	box2 = display.newGroup()
	sceneGroup:insert(box2)

	box3 = display.newGroup()
	sceneGroup:insert(box3)

	problem = display.newGroup()
	sceneGroup:insert(problem)
	display.setDefault("background", 20 / 255, 20 / 255, 20 / 255)
	
	


	b1 = display.newImageRect("ghost.png", width / 6, width / 6)
	b1.x = width / 6 + 10
	b1.y = height + 10
	box1:insert(b1)
	t1 = display.newText(math.random(11, 81), width / 6 + 10, height + height / 10, font, 20)
	box1:insert(t1)

	 b2 = display.newImageRect("ghost.png", width / 6, width / 6)
	b2.x = width / 6 + width / 3 + 10
	b2.y = height + 10
	box2:insert(b2)	
	t2 = display.newText(tostring(x * y), width / 6 + width / 3 + 10, height + height / 10, font, 20)
	box2:insert(t2)



	
	 b3 = display.newImageRect("ghost.png",width / 6, width / 6)
	b3.x = width / 6 + width / 3 * 2 + 10
	b3.y = height + 10
	box3:insert(b3)	
	 t3 = display.newText(math.random(11, 81), width / 6 + width / 3 * 2 + 10, height + height / 10, font, 20)
	box3:insert(t3)

	ball = display.newImageRect( "pacman-D2_burned (1).png", width / 3, width / 3)
	ball.x = width / 2 + 10
	ball.y = width / 6 + 10
	problem:insert(ball)
	
	task = display.newText(problem, tostring(x) .. " * " .. tostring(y) .." = ?", width / 2, width / 6 + 10, font, 20)
	task:setFillColor(0, 0, 1)


	leftbutton = widget.newButton {
		onPress = function ( event )
			if problem.x > -width / 3
			then
				problem.x = problem.x - width / 3;
			end
		end,
		top = 0,
		left = 0,
		width = width / 2,
		height = height,
		labelColor = { default={1 - 215 / 255, 1 - 149 / 255, 1 - 71 / 255}, over={1 - 215 / 255, 1 - 149 / 255, 1 - 71 / 255 } },
	}
	sceneGroup:insert(leftbutton)


	rightbutton = widget.newButton {
		onPress = function ( event )
			if problem.x < width / 3
			then
				problem.x = problem.x + width / 3;
			end
		end,
		top = 0,
		left = width / 2,
		width = width / 2,
		height = height,
		labelColor = { default={1 - 215 / 255, 1 - 149 / 255, 1 - 71 / 255}, over={1 - 215 / 255, 1 - 149 / 255, 1 - 71 / 255 } },
	}
	sceneGroup:insert(rightbutton)




	function check_answer()
		if (problem.x == 0 and answer == 2) or (problem.x == width / 3 and answer == 3 ) or (problem.x == -width / 3 and answer == 1) then
			return true
		end
		return false
	end

	function randomize( answer )
		if answer == 3
			then
			t1.text = math.random(11, 81)
			t2.text = math.random(11, 81)
			t3.text = x * y
			while t1.text == t2.text or t1.text == t3.text or t2.text == t3.text do
				t1.text = math.random(11, 81)
				t2.text = math.random(11, 81)
			end
		elseif answer == 2
			then
			t1.text = math.random(11, 81)
			t3.text = math.random(11, 81)
			t2.text = x * y
			while t1.text == t2.text or t1.text == t3.text or t2.text == t3.text do
				t1.text = math.random(11, 81)
				t3.text = math.random(11, 81)
			end
		else
			t2.text = math.random(11, 81)
			t3.text = math.random(11, 81)
			t1.text = x * y
			while t1.text == t2.text or t1.text == t3.text or t2.text == t3.text do
				t3.text = math.random(11, 81)
				t2.text = math.random(11, 81)
			end
		end
	end
	answer = math.random(1, 3)
	randomize(answer)
	function onUpdate( event )
		if problem.y> height - 70
			then
			if check_answer() then
				problem.y = 0
				problem.x = 0
				math.randomseed(os.time())
				x = math.random(1, 9)
				y = math.random(1, 9)
				task.text = (tostring(x) .. " * " .. tostring(y) .." = ?")
				answer = math.random(1, 3)
				randomize(answer)
			else
				endGame()
				
			end

		else
			problem.y = problem.y + speed
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



	sceneGroup:insert(leftbutton)
	Runtime:addEventListener("enterFrame", onUpdate)
end
function scene:show(event)
	local sceneGroup = self.view
	problem.y = 0
	print(speed)
	randomize(answer)
	Runtime:addEventListener("enterFrame", onUpdate)
	
end


scene:addEventListener("show", scene)
scene:addEventListener("create", scene)
return scene;