extends Label

func _ready() -> void:
	SignalBus.currency_updated.connect(purchase_made)
	update_text()

func update_text() ->void:
	self.text = "Currency: €" + str(GameManager.CURRENCY)


func purchase_made(_cost = 0) ->void:
	update_text()
	#$FmodEventEmitter2D.play()
