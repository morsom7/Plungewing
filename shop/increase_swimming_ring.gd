extends Button


@onready var label = $Amount				# UPDATE!!!

func get_cost() -> int:
	var variable = GameManager.SWIMMING_RINGS+1			# UPDATE!!!
	return 10 * variable * variable

func _ready() -> void:
	update_texts()

func update_texts() -> void:
	var variable = GameManager.SWIMMING_RINGS			# UPDATE!!!
	label.text = "Amount: " + str(variable)
	self.text = "Upgrade: €" + str(get_cost())


func _on_button_up() -> void:
	SignalBus.button_click.emit()
	if GameManager.CURRENCY > get_cost():
		GameManager.increase_swimming_rings(get_cost())
		update_texts()
