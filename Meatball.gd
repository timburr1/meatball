extends Node2D

func _on_Area2D_area_entered(_area):
	print("CHOMP")
	# if(area.get_collision_layer_bit(1)):
	$AudioStreamPlayer.play()
	Global.hunger -= 1
	queue_free()
