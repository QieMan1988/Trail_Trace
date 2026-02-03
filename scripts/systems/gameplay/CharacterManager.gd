class_name CharacterManager
extends BaseManager

## Manages player characters and NPCs

signal character_spawned(character_node)
signal character_died(character_node)

func _ready() -> void:
	super._ready()
	_logger_name = "CharacterManager"

func initialize() -> void:
	super.initialize()
	# TODO: Initialize character pools or factory
	print_debug("CharacterManager initialized")

func spawn_player(position: Vector3) -> Node:
	print_debug("Spawning player at ", position)
	# TODO: Instantiate player scene
	return Node.new() # Placeholder
