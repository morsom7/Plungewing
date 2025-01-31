extends Node2D

const main_menu_scene_path = "res://main_menu/main_menu.tscn"
const escape_tub_scene_path = "res://escaping_tub/escaping_tub.tscn"
const shop_scene_path = "res://shop/shop.tscn"

var current_scene = preload(main_menu_scene_path).instantiate()


func _ready() -> void:
	SignalBus.open_main_menu.connect(load_main_menu)
	SignalBus.next_escape_attempt.connect(load_scene_escape_attempt)
	SignalBus.ui_go.connect(load_scene_escape_attempt)
	SignalBus.ui_retry.connect(load_scene_escape_attempt)
	SignalBus.open_shop.connect(load_shop_scene)
	
	SignalBus.open_main_menu.emit()


func load_main_menu() -> void:
	# Change scene
	var main_menu_scene = preload(main_menu_scene_path).instantiate()
	add_child(main_menu_scene)
	get_tree().change_scene_to_packed(main_menu_scene)
	remove_child(current_scene)
	current_scene = main_menu_scene
	
	# Stop music
	
func load_scene_escape_attempt() -> void:
	# Change scene
	var escape_tub_scene = preload(escape_tub_scene_path).instantiate()
	if current_scene == escape_tub_scene:
		get_tree().reload_scene()
	else:
		add_child(escape_tub_scene)
		get_tree().change_scene_to_packed(escape_tub_scene)
		remove_child(current_scene)
		current_scene = escape_tub_scene
	# Stop music
#
func load_shop_scene() -> void:
	# Change scene
	var shop_scene = preload(shop_scene_path).instantiate()
	add_child(shop_scene)
	get_tree().change_scene_to_packed(shop_scene)
	remove_child(current_scene)
	current_scene = shop_scene
	# Play music
	
