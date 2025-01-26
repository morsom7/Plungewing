extends Node2D
@onready var end_run_screen_canvas: CanvasGroup = $end_run_screen_canvas


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.duck_splash.connect(end_run_screen)
	end_run_screen_canvas.visible = false
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

func end_run_screen():
	end_run_screen_canvas.visible = true
	pass
