extends Node2D

var main_menu_scene = preload("res://main_menu/main_menu.tscn").instantiate()
var escape_tub_scene = preload("res://escaping_tub/escaping_tub.tscn").instantiate()
var shop_scene = preload("res://shop/shop.tscn").instantiate()

var current_scene = main_menu_scene

func _ready() -> void:
	SignalBus.open_main_menu.connect(load_main_menu)
	SignalBus.next_escape_attempt.connect(load_scene_escape_attempt)
	SignalBus.open_shop.connect(load_shop_scene)
	
	add_child(current_scene)


func load_main_menu() -> void:
	current_scene.free()
	current_scene = main_menu_scene
	add_child(current_scene)
	#get_tree().change_scene_to_packed(main_menu_scene)
	
func load_scene_escape_attempt() -> void:
	add_child(escape_tub_scene)
	get_tree().change_scene_to_packed(escape_tub_scene)
	remove_child(current_scene)
	current_scene = escape_tub_scene

func load_shop_scene() -> void:
	get_tree().change_scene_to_packed(shop_scene)
