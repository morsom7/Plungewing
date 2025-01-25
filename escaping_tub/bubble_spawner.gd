extends Node2D

# X variables
var length : int = 100000
var distance_x : int = 500

# Y variables
var height : int = 5000
var distance_y : int = 250

# Other variables
var diff : int = distance_x / 2 	#random interval
@onready var bubble_scene: PackedScene = preload("res://escaping_tub/bubble.tscn")

func _ready() -> void:
	for x in range(0,length,distance_x):
		for y in range(0,height,distance_y):
			var temp_x = randi_range(x-diff, x+diff)
			var temp_y = -clamp(randi_range(y-diff, y+diff),0,height)
			#print(Vector2(temp_x, temp_y))
			var bubble_temp = bubble_scene.instantiate()
			bubble_temp.position = Vector2(temp_x, temp_y)
			##print(location)
			add_child(bubble_temp)
			##print("Made child")
