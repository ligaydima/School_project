local composer = require("composer")
composer.recycleOnSceneChange = true
SCORE = 0
MIN_NUMBER = 1
MAX_NUMBER = 100
upper_num_limit = math.floor((MIN_NUMBER + MAX_NUMBER) / 2)
speed_min = 0.5
speed_max = 5
players = {"cyan", "magenta", "yellow"}
choice = 3
cur_player = 3
prev_speed_slider_val = 50
speed = (speed_min + speed_max) / 2.0
TYPE = 1
composer.gotoScene( "Scenes.menu" )
