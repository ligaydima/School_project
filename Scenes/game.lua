local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")
c = {"простой", "средний", "сложный"}
function scene:create( event )
	local sceneGroup = self.view
	display.newRoundedRect(sceneGroup, display.contentCenterX, display.contentCenterY, 240, 300, 20):setFillColor(1)
	local submitButton = widget.newButton
	{
		alpha = 1,
		shape = "roundedRect",
		radius = 20,
		width = 240,
		height = 50,
		left = 40,
		top = 340,
		labelColor = { default={0}, over={0.3} },
		label = "Сыграть ещё",
		onPress = function( event )
			composer.hideOverlay("fade", 200)
			composer.gotoScene("Scenes.game")
		end
	}
	submitButton:setFillColor(1)
	local restext = display.newText("Поражение!", 160, 115, font, 20)
	local restext2 = display.newText("Счёт:" .. tostring(score), 160, 165, font, 20)
	restext:setFillColor(0)
	restext2:setFillColor(0)
	sceneGroup:insert(restext)
	sceneGroup:insert(restext2)
	local ctext = display.newText("Выберите сложность", 160, 235, font, 20)
	ctext:setFillColor(0)
	cbutton = widget.newButton {
		label = "средний",
		alpha = 1,
		onPress = function ( event )
			cnt = cnt + 1
			cnt = cnt % 3
			cbutton:setLabel(c[cnt + 1])
			if cnt == 1 then speed = speed2
			elseif cnt == 2 then speed = speed3
			else speed = speed1
			end
			end,
		top = 255,
		left = width / 4,
		labelColor = { default={0}, over={0.3} },
	}
	cbutton:setFillColor(1)
	sceneGroup:insert(submitButton)
	sceneGroup:insert(cbutton)
	sceneGroup:insert(ctext)
end

function scene:show( event )
	if event.phase == "will"
	then
		speed = speed2
		cnt = 1
	end
end
scene:addEventListener("show", scene)
scene:addEventListener("create", scene)
return scene
