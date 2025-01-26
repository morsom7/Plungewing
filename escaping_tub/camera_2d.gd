extends Camera2D
@onready var rubber_duck: RigidBody2D = $"../RubberDuck"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.global_position = Vector2(rubber_duck.global_position.x,rubber_duck.global_position.y)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.global_position = Vector2(rubber_duck.global_position.x,rubber_duck.global_position.y)
	pass
