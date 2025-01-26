extends Node

# Player currency
var CURRENCY: int = 0

# Upgrade level
enum UPGRADE_LEVEL {LOW, MEDIUM, MAX}

var BOTTLE_LEVEL = UPGRADE_LEVEL.LOW
var FLAP_POWER = UPGRADE_LEVEL.LOW
var FLAP_AMOUNT: int = 3			# Number of flaps to increase height
var SWIMMING_RINGS: int = 0		# Gives a bounce if hits the water

func _ready() -> void:

	SignalBus.duck_bubble_bounced.connect(bubble_bounced)
	SignalBus.duck_splash.connect(duck_splashed)


func get_upgrade_level_as_string(level):
	match level:
		UPGRADE_LEVEL.LOW: return "Low"
		UPGRADE_LEVEL.MEDIUM: return "Medium"
		UPGRADE_LEVEL.MAX: return "Max"
	return "Unknown"


func upgrade_bottle(cost) -> bool:
	CURRENCY -= cost
	SignalBus.currency_updated.emit(cost)
	BOTTLE_LEVEL = (BOTTLE_LEVEL + 1 as UPGRADE_LEVEL)
	if BOTTLE_LEVEL == UPGRADE_LEVEL.MAX:
		return true
	else:
		return false	

func increase_flap_power(cost) -> bool:
	CURRENCY -= cost
	SignalBus.currency_updated.emit(cost)
	FLAP_POWER = (FLAP_POWER + 1 as UPGRADE_LEVEL)
	if FLAP_POWER == UPGRADE_LEVEL.MAX:
		return true
	else:
		return false

func increase_flap_amount(cost) -> void:
	CURRENCY -= cost
	SignalBus.currency_updated.emit(cost)
	FLAP_AMOUNT += 1

func increase_swimming_rings(cost) -> void:
	CURRENCY -= cost
	SignalBus.currency_updated.emit(cost)
	SWIMMING_RINGS += 1

func bubble_bounced(bubble_type) ->void:
	if bubble_type == "normal":
		CURRENCY += 1
		SignalBus.currency_updated.emit()
	if bubble_type == "super":
		CURRENCY += 2
		SignalBus.currency_updated.emit()
	
func duck_splashed() -> void:
	pass
	# pop-up menu for shop / go again
