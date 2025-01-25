extends Node
# Always loaded files gobally available: https://docs.godotengine.org/en/stable/tutorials/scripting/singletons_autoload.html

# Rubber duck signals
signal duck_stops_moving
signal duck_flaps

# Bubble signals
signal duck_bubble_bounced(bounce_power:float, bounce_type:String)


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
