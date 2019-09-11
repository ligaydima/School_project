local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")
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
	local restext2 = display.newText("Счёт:" .. tostring(SCORE), 160, 165, font, 20)
	restext:setFillColor(0)
	restext2:setFillColor(0)
	sceneGroup:insert(restext)
	sceneGroup:insert(restext2)
	menubutton = widget.newButton{
		label = "На главную",
		labelColor = { default={0}, over={0.3} },
		width = 240,
		height = 50,
		left = 40,
		top = 280,
		onPress = function(event)
			composer.hideOverlay( "fade", 200 )
			composer.gotoScene("Scenes.menu")
		end
	}

	sceneGroup:insert(submitButton)
	sceneGroup:insert(menubutton)
end

function scene:show( event )
end
scene:addEventListener("show", scene)
scene:addEventListener("create", scene)
return scene
