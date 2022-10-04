extends Node2D

enum GameState { Loading, Running, GameOver }

onready var state = GameState.Loading
onready var meatball_obj = preload("res://Meatball.tscn")
onready var spawn_timer = $SpawnTimer

var carlos = null

func _ready():
	carlos = load("res://Carlos.tscn").instance()
	carlos.position = Vector2(get_viewport_rect().size.x / 2, get_viewport_rect().size.y / 2)
	add_child(carlos)
	spawn_meatballs()
	state = GameState.Running
	spawn_timer.start()

func _process(_delta):
	
	$HUD/Scoreboard.update_text()
	
	if spawn_timer.time_left == 0:
		spawn_meatball(20 + randi() % int(get_viewport_rect().size.x - 20), 20 + randi() % int(get_viewport_rect().size.y - 20))
		spawn_timer.wait_time = 3.0
		spawn_timer.start()
	
func spawn_meatball(x,y):
	var meatball = meatball_obj.instance()
	meatball.set_position(Vector2(x,y))
	add_child(meatball)
	
func spawn_meatballs():
	randomize()
	# One extra enemy per stage
	for i in range(0, 6):
		spawn_meatball(20 + randi() % int(get_viewport_rect().size.x - 20), 20 + randi() % int(get_viewport_rect().size.y - 20))
