extends Node2D
@onready var milestone_text: Label = $Panel/MilestoneText



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	milestone_text.text = str(self.global_position.x / 100)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
