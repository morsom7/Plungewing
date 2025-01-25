extends CollisionShape2D

@export var normal_bubbles: int = 5

@onready var spawnArea = self.shape.size
@onready var origin = global_position -  spawnArea
@onready var bubble_scene: PackedScene = preload("res://escaping_tub/bubble.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for bubbles in normal_bubbles:
		var location = gen_random_pos()
		var bubble_temp = bubble_scene.instantiate()
		bubble_temp.position = location
		#print(location)
		add_child(bubble_temp)


func gen_random_pos():
	var x = randi_range(origin.x, spawnArea.x)
	var y = randi_range(origin.y, spawnArea.y)
	
	return Vector2(x, y)
