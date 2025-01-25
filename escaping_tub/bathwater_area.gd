extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print("body_entered")
	SignalBus.duck_hit_water.emit()
	pass # Replace with function body.
