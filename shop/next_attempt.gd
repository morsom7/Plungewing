extends Button

func _on_button_up() -> void:
	SignalBus.next_escape_attempt.emit()
	pass # Replace with function body.
