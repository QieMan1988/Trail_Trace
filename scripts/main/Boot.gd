extends Node

func _ready() -> void:
	print("Booting Game...")
	
	# Initialize Systems (Manual DI for MVP)
	# In a real game, this might be data-driven
	
	var ui_mgr = UIManager.new()
	ui_mgr.name = "UIManager"
	add_child(ui_mgr)
	ui_mgr.initialize()
	
	var eco_mgr = EconomyManager.new()
	eco_mgr.name = "EconomyManager"
	add_child(eco_mgr)
	eco_mgr.initialize()
	
	print("Systems Initialized. Loading Main Menu...")
	call_deferred("_load_menu")

func _load_menu() -> void:
	get_tree().change_scene_to_file("res://scenes/main/MainMenu.tscn")
