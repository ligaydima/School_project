local composer = require("composer")
composer.recycleOnSceneChange = true
SCORE = 0
COMPLEXITIES = {"простой", "средний", "сложный"}
lower_num_limit = 1
upper_num_limit = 9
SPEED1 = 0.5
SPEED2 = 0.7
SPEED3 = 1
SPEED = SPEED2
TYPE = 1
composer.gotoScene( "Scenes.menu" )
