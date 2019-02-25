local composer = require("composer")
display.setDefault("background", 20 / 255, 20 / 255, 20 / 255)
height = display.contentHeight - 20
width = display.contentWidth - 20
score = 0
local ctext = display.newText("Выберите сложность", width / 2 + 10, height / 4 + 10, font, 20)
speed = 0.5
cnt = 1
local widget = require("widget")
startbutton = widget.newButton {
	label = "Нажми, чтобы начать!",

	onPress = function ( event )
		composer.gotoScene("Scenes.game");
		startbutton:removeSelf();
		cbutton:removeSelf();
		ctext:removeSelf();
		end,
	top = display.contentCenterY,
	left = display.contentCenterX / 2,
	labelColor = { default={1}, over={1} },
}
c = {"простой", "средний", "сложный"}
cbutton = widget.newButton {
	label = "средний",
	
	onPress = function ( event )
		cnt = cnt + 1
		cnt = cnt % 3
		cbutton:setLabel(c[cnt + 1])
		if cnt == 1 then speed = 0.7
		elseif cnt == 2 then speed = 1
		else speed = 0.5
		end
		end,
	top = height / 4 + 35,
	left = display.contentCenterX / 2 + 10,
	labelColor = { default={1}, over={1} },
}