extends Button

@onready var label = $Power				# UPDATE!!!
var cost = [350, 1000]

func _ready() -> void:
	update_texts()

func update_texts() -> void:
	var variable = GameManager.BOTTLE_LEVEL			# UPDATE!!!
	label.text = "Power: " + GameManager.get_upgrade_level_as_string(variable)
	if self.disabled:
		self.text = "Maxed out"
	else:
		self.text = "Upgrade: €" + str(cost[variable])


func _on_button_up() -> void:
	var variable = GameManager.BOTTLE_LEVEL			# UPDATE!!!
	# If enough currency
	if GameManager.CURRENCY > cost[variable]:
		var reached_max_level = GameManager.upgrade_bottle(cost[variable])
		if reached_max_level:
			self.disabled = true
		update_texts()
