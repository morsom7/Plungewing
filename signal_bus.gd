extends Node
# Always loaded files gobally available: https://docs.godotengine.org/en/stable/tutorials/scripting/singletons_autoload.html

# GameManager
signal button_click
signal open_main_menu
signal next_escape_attempt
signal ui_go		# starting escape_attempt from different scene
signal ui_retry		# for retry while escape_attempt is active scene
signal open_shop
signal currency_updated(cost)

# Bottle
signal bottle_popped

# Rubber duck signals
signal duck_flaps
signal duck_hit_water
signal duck_splash

# Bubble signals
signal duck_bubble_bounced(bounce_type:String)


# ***** Signals *****
#
# More on Signals: 
# https://docs.godotengine.org/en/stable/getting_started/step_by_step/signals.html
#
# ** To emit a signal from somewhere: **
#	func _whatever_function():
#	    SignalBus.duck_bounced.emit(10)	# or a fitting number
#
# ** For the functions to act upon a signal being emitted: **
#	func _ready():
#	    SignalBus.duck_bounced.connect(_function_to_be_called)
#
#	func _function_to_be_called(bounce_power):
#	    # Your code here…
