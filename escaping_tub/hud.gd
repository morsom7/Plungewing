extends Control

func _ready() -> void:
	SignalBus.duck_flaps.connect(update_flaps)
	SignalBus.duck_swimming_rings_remaining.connect(update_flaps)
	SignalBus.currency_updated.connect(update_currency)

func _on_button_button_up() -> void:
	SignalBus.ui_go.emit()

func update_swimming_rings(remaining: int) -> void:
	$SwimmingRings.text = "Swimming rings: " + str(remaining)

func update_flaps(remaining: int) -> void:
	$Flaps.text = "Flaps: " + str(remaining)

func update_currency() ->void:
	$Currency.text = "Currency: €" + str(GameManager.CURRENCY)
	pass
