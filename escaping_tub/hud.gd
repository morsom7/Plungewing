extends Control

func _ready() -> void:
	SignalBus.duck_flaps.connect(update_flaps)
	SignalBus.duck_swimming_rings_remaining.connect(update_swimming_rings)
	SignalBus.currency_updated.connect(update_currency)
	
	update_swimming_rings(GameManager.SWIMMING_RINGS)
	update_flaps(GameManager.FLAP_AMOUNT)
	update_currency()

func _on_button_button_up() -> void:
	SignalBus.ui_go.emit()

func update_flaps(remaining: int) -> void:
	$Flaps.text = "Flaps: " + str(remaining)

func update_swimming_rings(remaining: int) -> void:
	$SwimmingRings.text = "Swimming rings: " + str(remaining)

func update_currency() ->void:
	$Currency.text = "Currency: €" + str(GameManager.CURRENCY)
