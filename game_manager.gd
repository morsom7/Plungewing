extends Node

# Player currency
var CURRENCY: int = 100

# Upgrade level
enum {LOW, MEDIUM, MAX}

enum {BOTTLE_CONTROLS, DUCK_CONTROLS}
var control_mode = BOTTLE_CONTROLS

var BOTTLE_LEVEL = LOW
var FLAP_POWER = LOW
var FLAP_AMOUNT: int = 3			# Number of flaps to increase height
var SWIMMING_RINGS: int = 0		# Gives a bounce if hits the water

func increase_flap_power(cost) -> bool:
	CURRENCY -= cost
	SignalBus.purchase_made.emit(cost)
	FLAP_POWER += 1
	if FLAP_POWER == MAX:
		return true
	else:
		return false
