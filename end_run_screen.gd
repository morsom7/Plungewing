extends Node2D
@onready var end_run_screen_canvas: CanvasGroup = $end_run_screen_canvas
@onready var stats_label_distance: Label = $end_run_screen_canvas/ScreenSpace/StatsVertical/StatsCenter/StatsPanel/StatsLabelDistance
@onready var rubber_duck: RigidBody2D = %RubberDuck

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.duck_splash.connect(end_run_screen)
	end_run_screen_canvas.visible = false
	rotation_degrees = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_rotation_degrees = 0
	
	pass

func end_run_screen():
	end_run_screen_canvas.visible = true
	stats_label_distance.text = str(int(rubber_duck.global_position.x/100))
	pass


func _on_retry_button_pressed() -> void:
	print("Retry")
	SignalBus.ui_retry.emit()
	pass # Replace with function body.


func _on_home_button_pressed() -> void:
	print("Home")
	SignalBus.open_main_menu.emit()
	pass # Replace with function body.


func _on_quit_button_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_shop_button_pressed() -> void:
	print("Shop")
	SignalBus.open_shop.emit()
	pass # Replace with function body.
