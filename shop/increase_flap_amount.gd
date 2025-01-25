extends Button


@onready var label = $Amount				# UPDATE!!!

func get_cost() -> int:
	var variable = GameManager.FLAP_AMOUNT-2			# UPDATE!!!
	return 10 * variable * variable

func _ready() -> void:
	update_texts()

func update_texts() -> void:
	var variable = GameManager.FLAP_AMOUNT			# UPDATE!!!
	label.text = "Amount: " + str(variable)
	self.text = "Upgrade: €" + str(get_cost())


func _on_button_up() -> void:
	var variable = GameManager.FLAP_AMOUNT			# UPDATE!!!
	# If enough currency
	if GameManager.CURRENCY > get_cost():
		GameManager.increase_flap_amount(get_cost())
		update_texts()
