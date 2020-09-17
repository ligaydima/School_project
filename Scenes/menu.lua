local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")
composer.recycleOnSceneChange = true
function change_limit (ev)
    upper_num_limit = ev.value
    if (upper_num_limit == 100) then upper_num_limit = 99 end
    upper_num_limit = math.max(upper_num_limit, 3)
    num_text.text = "Максимальный множитель: ".. tostring(upper_num_limit)
end
function scene:create( event )
    local sceneGroup = self.view
    local composer = require("composer")
    display.setDefault("background", 20 / 255, 20 / 255, 20 / 255)
    local ctext = display.newText("Выберите скорость", display.contentCenterX, 30, font, 20)
    local cnt = 1
    local widget = require("widget")
    startbutton = widget.newButton {
    	label = "Нажми, чтобы начать!",

    	onPress = function ( event )
    		composer.gotoScene("Scenes.game");
    		-- startbutton:removeSelf();
    		-- ctext:removeSelf();
    		end,
    	top = 240,
    	left = 80,
    	labelColor = { default={1}, over={1} },
    }
    num_text = display.newText("Максимальный множитель: ".. tostring(upper_num_limit), display.contentCenterX, 220, font, 20)
    diff_slider = widget.newSlider( {
        top = 70,
        left = 30,
        width = 270,
        height = 50,
        listener = function (ev)
            speed = speed_min + (speed_max - speed_min) / 100.0 * ev.value
        end
    })
    limit_slider = widget.newSlider( {
        top = 180,
        left = 30,
        width = 270,
        height = 50,
        listener = change_limit
    })
    sceneGroup:insert(diff_slider)
    sceneGroup:insert(limit_slider)
    sceneGroup:insert(num_text)
    local boundariestext = display.newText("Выберите границы чисел", display.contentCenterX, 130, font, 20)

    sceneGroup:insert(startbutton)
    sceneGroup:insert(ctext)
    sceneGroup:insert(boundariestext)

end
function scene:show(event)
end


scene:addEventListener("show", scene)
scene:addEventListener("create", scene)
return scene;
