extends Node2D

func _on_retry_button_button_up() -> void:
	print("new run")
	SignalBus.next_escape_attempt.emit()
	pass # Replace with function body.


func _on_shop_button_button_up() -> void:
	print("shop")
	SignalBus.open_shop.emit()
	pass # Replace with function body.


func _on_quit_button_button_up() -> void:
	print("quit")
	get_tree().quit()
	pass # Replace with function body.


func _on_testknapp_pressed() -> void:
	print("shop")
	SignalBus.open_shop.emit()
	pass # Replace with function body.
