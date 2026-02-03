extends Node2D

func _ready() -> void:
	if ModeManager.current_mode:
		print("Entered Level. Current Mode: ", ModeManager.current_mode.name)
		GlobalEventBus.emit_signal("level_started", "Level_01")
	else:
		push_error("No mode selected!")

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"): # Escape
		print("Returning to Main Menu...")
		get_tree().change_scene_to_file("res://scenes/main/MainMenu.tscn")
