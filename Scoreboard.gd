extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	var rand = RandomNumberGenerator.new()
	rand.randomize()
	Global.hunger = rand.randi_range(4, 10)
	update_text()

func update_text():
	if Global.hunger > 0:
		self.text = "Carlos Segundo tiene hambre! El quiere " + str(Global.hunger) + " mas albondigas."
	else:
		self.text = "Wahoo, Carlos Segundo no tiene hambre ya!"
