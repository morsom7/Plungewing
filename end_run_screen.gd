extends Node2D
@onready var end_run_screen_canvas: CanvasGroup = $end_run_screen_canvas
@onready var camera_2d: Camera2D = $"../RubberDuck/Camera2D"
@onready var rubber_duck: RigidBody2D = $"../RubberDuck"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.duck_splash.connect(end_run_screen)
	
	end_run_screen_canvas.visible = false
	rotation_degrees = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_rotation_degrees = 0
	global_position = Vector2(rubber_duck.global_position.x,rubber_duck.global_position.y)
	
	pass

func end_run_screen():
	end_run_screen_canvas.visible = true
	pass


func _on_retry_button_pressed() -> void:
	print("Retry")
	SignalBus.next_escape_attempt.emit()
	pass # Replace with function body.


func _on_home_button_pressed() -> void:
	print("Home")
	SignalBus.open_main_menu.emit()
	pass # Replace with function body.


func _on_quit_button_pressed() -> void:
	pass # Replace with function body.
