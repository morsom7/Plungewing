extends Node

var main_menu_scene = "res://main_menu/main_menu.tscn"
var escape_tub_scene = "res://escaping_tub/escaping_tub.tscn"
var shop_scene = "res://shop/shop.tscn"

# Player currency
var CURRENCY: int = 10000

# Upgrade level
enum UPGRADE_LEVEL {LOW, MEDIUM, MAX}

var BOTTLE_LEVEL = UPGRADE_LEVEL.LOW
var FLAP_POWER = UPGRADE_LEVEL.LOW
var FLAP_AMOUNT: int = 3			# Number of flaps to increase height
var SWIMMING_RINGS: int = 0		# Gives a bounce if hits the water

func _ready() -> void:
	SignalBus.open_main_menu.connect(load_main_menu)
	SignalBus.next_escape_attempt.connect(load_scene_escape_attempt)
	SignalBus.open_shop.connect(load_shop_scene)

func load_main_menu() -> void:
	get_tree().change_scene_to_file(main_menu_scene)
	
func load_scene_escape_attempt() -> void:
	get_tree().change_scene_to_file(escape_tub_scene)

func load_shop_scene() -> void:
	get_tree().change_scene_to_file(shop_scene)

func get_upgrade_level_as_string(level):
	match level:
		UPGRADE_LEVEL.LOW: return "Low"
		UPGRADE_LEVEL.MEDIUM: return "Medium"
		UPGRADE_LEVEL.MAX: return "Max"
	return "Unknown"


func upgrade_bottle(cost) -> bool:
	CURRENCY -= cost
	SignalBus.purchase_made.emit(cost)
	BOTTLE_LEVEL = (BOTTLE_LEVEL + 1 as UPGRADE_LEVEL)
	if BOTTLE_LEVEL == UPGRADE_LEVEL.MAX:
		return true
	else:
		return false	

func increase_flap_power(cost) -> bool:
	CURRENCY -= cost
	SignalBus.purchase_made.emit(cost)
	FLAP_POWER = (FLAP_POWER + 1 as UPGRADE_LEVEL)
	if FLAP_POWER == UPGRADE_LEVEL.MAX:
		return true
	else:
		return false

func increase_flap_amount(cost) -> void:
	CURRENCY -= cost
	SignalBus.purchase_made.emit(cost)
	FLAP_AMOUNT += 1

func increase_swimming_rings(cost) -> void:
	CURRENCY -= cost
	SignalBus.purchase_made.emit(cost)
	SWIMMING_RINGS += 1
