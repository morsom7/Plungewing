extends Node2D



func _on_button_button_up() -> void:
	SignalBus.next_escape_attempt.emit()
