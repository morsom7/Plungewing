extends Area2D


@export var bubble_type:String = "normal"


func _ready() -> void:
	#match type:
		#BUBBLE_TYPE.NORMAL: $AnimatedSprite2D.animation = ???
		#BUBBLE_TYPE.SLOW: $AnimatedSprite2D.animation = ???
		#BUBBLE_TYPE.SUPER: $AnimatedSprite2D.animation = ???
	pass # Replace with function body.


func _on_body_entered(body: Node) -> void:
	# Only detects the player, because the player has Collision = 2, and Bubble has Mask = 2
	print("Bubble popped")
	SignalBus.duck_bubble_bounced.emit(bubble_type)
	# play animation -> animation + fade
	$FmodBankLoader/SFX_bubble_pop.play_one_shot()

#After bubble being popped and SFX stoppped playing, remove bubble:
func _on_sfx_bubble_pop_stopped() -> void:
	queue_free()
