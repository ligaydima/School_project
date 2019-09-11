local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")
composer.recycleOnSceneChange = true
function scene:create( event )
  local sceneGroup = self.view
  local composer = require("composer")
  display.setDefault("background", 20 / 255, 20 / 255, 20 / 255)
  local ctext = display.newText("Выберите сложность", 170, 130, font, 20)
  local cnt = 1
  local widget = require("widget")
  startbutton = widget.newButton {
  	label = "Нажми, чтобы начать!",

  	onPress = function ( event )
  		composer.gotoScene("Scenes.game");
  		-- startbutton:removeSelf();
  		-- cbutton:removeSelf();
  		-- ctext:removeSelf();
  		end,
  	top = 240,
  	left = 80,
  	labelColor = { default={1}, over={1} },
  }
  cbutton = widget.newButton {
  	label = "средний",

  	onPress = function ( event )
  		cnt = cnt + 1
  		cnt = cnt % 3
  		cbutton:setLabel(COMPLEXITIES[cnt + 1])
  		if cnt == 1 then SPEED = SPEED2
  		elseif cnt == 2 then SPEED = SPEED3
  		else SPEED = SPEED1
  		end
  		end,
  	top = 155,
  	left = 130,
  	labelColor = { default={1}, over={1} },
  }
  local boundariestext = display.newText("Выберите границы чисел", 170, 200, font, 20)

  sceneGroup:insert(cbutton)
  sceneGroup:insert(startbutton)
  sceneGroup:insert(ctext)
  sceneGroup:insert(boundariestext)

end
function scene:show(event)
end


scene:addEventListener("show", scene)
scene:addEventListener("create", scene)
return scene;
