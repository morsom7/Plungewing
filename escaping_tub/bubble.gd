extends Area2D

@export var bubble_type:String = "normal"

@onready var _animated_sprite = $AnimatedSprite2D


func _ready() -> void:
	match bubble_type:
		"normal": 
			_animated_sprite.play("normal")
		"super": 
			_animated_sprite.play("super")
		"slow": 
			_animated_sprite.play("slow")
	pass # Replace with function body.


func _on_body_entered(body: Node) -> void:
	# Only detects the player, because the player has Collision = 2, and Bubble has Mask = 2
	print("Bubble popped")
	SignalBus.duck_bubble_bounced.emit(bubble_type)
	_animated_sprite.play("pop")
	
	# play animation -> animation + fade
	$Timer.start()


func _on_timer_timeout() -> void:
	print("times up!")
	pass # Replace with function body.
