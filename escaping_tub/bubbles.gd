extends Node

var offset_x : int = 500
var length : int = 1000
var height : int = 1000
var diff : int = 300
@onready var bubble_scene: PackedScene = preload("res://escaping_tub/bubble.tscn")


func _ready() -> void:
	for x in length:
		for y in height:
			var temp_x = offset_x + randi_range(x-diff, x+diff)
			var temp_y = randi_range(y-diff, y+diff)
			var bubble_temp = bubble_scene.instantiate()
			bubble_temp.position = Vector2(temp_x, temp_y)
			#print(location)
			add_child(bubble_temp)
			#print("Made child")
