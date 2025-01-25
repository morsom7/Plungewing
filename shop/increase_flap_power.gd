extends Button

@onready var label = $Power

var cost = [10, 50]

func _ready() -> void:
	update_texts()

func update_texts() -> void:
	label.text = "Power: " + str(GameManager.FLAP_POWER)
	if self.disabled:
		self.text = "Maxed out"
	else:
		self.text = "Upgrade: " + str(cost[GameManager.FLAP_POWER])
	pass


func _on_button_up() -> void:
	# If enough currency
	if GameManager.CURRENCY > cost[GameManager.FLAP_POWER]:
		var reached_max_level = GameManager.increase_flap_power(cost[GameManager.FLAP_POWER])
		if reached_max_level:
			self.disabled = true
		update_texts()
	pass # Replace with function body.
