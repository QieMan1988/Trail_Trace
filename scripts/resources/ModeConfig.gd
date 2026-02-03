class_name ModeConfig
extends Resource

## Configuration resource for a specific game mode

@export_group("Identity")
@export var mode_id: String = "casual"
@export var display_name: String = "Casual Mode"
@export_multiline var description: String = "A relaxing exploration mode."

@export_group("Scene Configuration")
## The main scene to load when this mode starts
@export_file("*.tscn") var main_scene_path: String = ""
## Optional: UI scene to overlay
@export_file("*.tscn") var ui_overlay_path: String = ""

@export_group("Rules")
@export var enable_permadeath: bool = false
@export var initial_resources: Dictionary = {}
