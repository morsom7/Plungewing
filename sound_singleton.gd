extends Node

func _ready() -> void:
	connect_signals()
	load_banks()

func connect_signals() ->void:
	# UI effects
	SignalBus.button_click.connect(button_click_sound)
	# Scene music
	SignalBus.open_main_menu.connect(load_main_menu)
	SignalBus.next_escape_attempt.connect(load_scene_escape_attempt)
	SignalBus.ui_go.connect(fresh_escape_attempt)
	SignalBus.ui_retry.connect(retry_escape_attempt)
	SignalBus.open_shop.connect(load_shop_scene)
	# SFX in tub escape
	SignalBus.bottle_popped.connect(pop_the_bottle)
	SignalBus.duck_bubble_bounced.connect(bubble_bounced)
	SignalBus.duck_flaps.connect(duck_flapping)
	SignalBus.duck_splash.connect(duck_splashing)


var event: FmodEvent = null

func button_click_sound() -> void: play_sound("event:/UI/UI_Click")

func load_main_menu() -> void: play_sound("event:/STOPALLMUSIC", true)
func load_scene_escape_attempt() -> void: play_sound("event:/UI/UI_Go", true)
func fresh_escape_attempt() -> void: play_sound("event:/UI/UI_Go", true)
func retry_escape_attempt() -> void: play_sound("event:/UI/UI_Retry", true)
func load_shop_scene() -> void: play_sound("event:/UI/UI_Shop", true)

func pop_the_bottle() -> void: play_sound("event:/SFX/Bottle_PopLvl1")
#func bubble_bounced(bounce_type:String) -> void: play_sound("event:/SFX/Bottle_PopLvl1")
func bubble_bounced(bounce_type:String) -> void: play_sound("event:/SFX/Object/Object_Bounce")
func duck_flapping() -> void: play_sound("event:/SFX/Duck/Duck_Flap")
func duck_splashing() -> void: play_sound("event:/SFX/Duck/Duck_Death")


func play_sound(sound:String, button_clicked:bool = false) -> void:
	if button_clicked:
		button_click_sound()
	event = FmodServer.create_event_instance(sound)
	event.start()


var banks := Array()
func load_banks() -> void:
	banks.append(FmodServer.load_bank("res://audio/Master.bank", FmodServer.FMOD_STUDIO_LOAD_BANK_NORMAL))
	banks.append(FmodServer.load_bank("res://audio/Master.strings.bank", FmodServer.FMOD_STUDIO_LOAD_BANK_NORMAL))
	banks.append(FmodServer.load_bank("res://audio/Music.bank", FmodServer.FMOD_STUDIO_LOAD_BANK_NORMAL))
	banks.append(FmodServer.load_bank("res://audio/SFX.bank", FmodServer.FMOD_STUDIO_LOAD_BANK_NORMAL))
	banks.append(FmodServer.load_bank("res://audio/UI.bank", FmodServer.FMOD_STUDIO_LOAD_BANK_NORMAL))
