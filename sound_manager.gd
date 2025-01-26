extends FmodEventEmitter2D

#func _ready() -> void:
	#SignalBus.open_main_menu.connect(load_main_menu)
	#SignalBus.next_escape_attempt.connect(load_scene_escape_attempt)
	#SignalBus.open_shop.connect(load_shop_scene)
	#SignalBus.ui_go.connect(fresh_escape_attempt)
	#SignalBus.ui_retry.connect(retry_escape_attempt)
	#
	#SignalBus.bottle_popped.connect(pop_the_bottle)
#
#func pop_the_bottle() -> void:
	##print("Bottle popped!")
	###event_name = "Bottle_Pop"
	##FmodServer.create_sound_instance("event:/Music/Music_Shop")
	##play_one_shot()
	##set_event_name("event:/SFX/Bottle_PopLvl1")
	#pass
	#set_event_name("event:/SFX/Bottle_PopLvl1")
	#play()
#
#func load_main_menu() -> void:
	#button_click_sound()
	#set_event_name("event:-/STOPALLMUSIC")
	#play()
#
#
#func load_scene_escape_attempt() -> void:
	#button_click_sound()
	#set_event_name("event:/UI/UI_Go")
	#play()
#
#func fresh_escape_attempt() ->void:
	#button_click_sound()
	#set_event_name("event:/UI/UI_Go")
	#play()
#
#func retry_escape_attempt() ->void:
	#button_click_sound()
	#set_event_name("event:/UI/UI_Retry")
	#play()
#
#func load_shop_scene() -> void:
	#button_click_sound()
	#set_event_name("event:/UI/UI_Shop")
	#play()
#
#func button_click_sound() -> void:
	#set_event_name("event:/UI/UI_Click")
	#play()
	#
