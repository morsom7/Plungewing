extends Label

func _ready() -> void:
	SignalBus.purchase_made.connect(update_text)
	update_text()

func update_text(cost = 0) ->void:
	self.text = "Currency: €" + str(GameManager.CURRENCY)
