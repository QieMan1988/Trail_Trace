class_name BaseMode
extends Node

# Signal emitted when mode is ready
signal mode_ready
signal mode_finished(result: Dictionary)

# Virtual method called when entering the mode
func enter() -> void:
	print("Entering mode: ", name)
	_setup_ui()
	_setup_systems()

# Virtual method called when exiting the mode
func exit() -> void:
	print("Exiting mode: ", name)
	_cleanup()

# Virtual method for per-frame update
func process_mode(delta: float) -> void:
	pass

# Private setup methods
func _setup_ui() -> void:
	pass

func _setup_systems() -> void:
	pass

func _cleanup() -> void:
	queue_free()
