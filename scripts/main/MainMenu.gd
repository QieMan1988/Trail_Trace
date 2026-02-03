extends Control

func _on_casual_btn_pressed() -> void:
	print("Selected Casual Mode")
	ModeManager.load_mode(ModeManager.GameMode.CASUAL)
	_enter_level()

func _on_survival_btn_pressed() -> void:
	print("Selected Survival Mode")
	ModeManager.load_mode(ModeManager.GameMode.SURVIVAL)
	_enter_level()

func _enter_level() -> void:
	get_tree().change_scene_to_file("res://scenes/core/GameLevel.tscn")
