extends Node2D

enum Directions {RIGHT, LEFT}

func _process(delta):
	var current_direction = Directions.RIGHT
	
	if (Input.is_key_pressed(KEY_LEFT) or Input.is_key_pressed(KEY_A) && self.position.x > 10):
		if(current_direction == Directions.RIGHT):
			$CarlosSprite.texture = load("res://resources/dogL.png") 
			current_direction = Directions.LEFT
		self.position.x -= 4
		
	if (Input.is_key_pressed(KEY_RIGHT) or Input.is_key_pressed(KEY_D) && self.position.x < get_viewport_rect().size.x - 10):
		if(current_direction == Directions.LEFT):
			$CarlosSprite.texture = load("res://resources/dogR.png")
			current_direction = Directions.RIGHT			
		self.position.x += 4
		
	if (Input.is_key_pressed(KEY_UP) or Input.is_key_pressed(KEY_W) && self.position.y > 10):
		self.position.y -= 4
		
	if (Input.is_key_pressed(KEY_DOWN) or Input.is_key_pressed(KEY_S) && self.position.y < get_viewport_rect().size.y - 10):
		self.position.y += 4
		
	if(Input.is_key_pressed(KEY_ESCAPE)):
		get_tree().quit()
