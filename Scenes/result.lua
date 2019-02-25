local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")
c = {"простой", "средний", "сложный"}
function scene:create( event )
	local sceneGroup = self.view
	display.newRoundedRect(sceneGroup, display.contentCenterX, display.contentCenterY, display.contentWidth / 4 * 3 - 20, display.contentHeight / 4 * 3, 20):setFillColor(1)
	local submitButton = widget.newButton
	{
		shape = "roundedRect",
		radius = 5,
		width = display.contentWidth / 3,
		height = display.contentHeight / 6,
		left = display.contentWidth / 3,
		top = display.contentHeight / 3 * 2,
		labelColor = { default={0}, over={0.3} },
		label = "Сыграть ещё",
		onPress = function( event )
			composer.hideOverlay("fade", 200)
			composer.gotoScene("Scenes.game")
		end
	}
	local ctext = display.newText("Выберите сложность", width / 2 + 10, height / 4 + 10, font, 20)
	ctext:setFillColor(0)
	cbutton = widget.newButton {
		label = "средний",
		
		onPress = function ( event )
			cnt = cnt + 1
			cnt = cnt % 3
			cbutton:setLabel(c[cnt + 1])
			if cnt == 1 then speed = 0.7
			elseif cnt == 2 then speed = 1.2
			else speed = 0.5
			end
			end,
		top = height / 4 + 35,
		left = display.contentCenterX / 2 + 10,
		labelColor = { default={0}, over={0.3} },
	}
	sceneGroup:insert(submitButton)
	sceneGroup:insert(cbutton)
	sceneGroup:insert(ctext)
end

function scene:show( event )
	speed = 0.5
end
scene:addEventListener("show", scene)
scene:addEventListener("create", scene)
return scene