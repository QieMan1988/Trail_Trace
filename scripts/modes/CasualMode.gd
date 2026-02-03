extends BaseMode
class_name CasualMode

const PLAYER_SCENE = preload("res://scenes/gameplay/Player.tscn")
const ITEM_SCENE = preload("res://scenes/gameplay/Collectible.tscn")

var _current_score: int = 0
var _player: PlayerCharacter

func enter() -> void:
	super.enter()
	print("Casual Mode Logic Started")
	GlobalEventBus.connect("level_started", _on_level_started)

func _on_level_started(level_name: String) -> void:
	print("CasualMode: Level started: ", level_name)
	_spawn_player()
	_spawn_items(5) # Spawn 5 items for demo

func _spawn_player() -> void:
	var level = get_tree().current_scene
	# Find spawn point or default to center
	var spawn_pos = Vector2(400, 300)
	if level.has_node("PlayerSpawn"):
		spawn_pos = level.get_node("PlayerSpawn").position
	
	_player = PLAYER_SCENE.instantiate()
	_player.position = spawn_pos
	level.add_child(_player)
	print("CasualMode: Player spawned at ", spawn_pos)

func _spawn_items(count: int) -> void:
	var level = get_tree().current_scene
	for i in range(count):
		var item = ITEM_SCENE.instantiate()
		# Random position for MVP
		item.position = Vector2(randf_range(100, 700), randf_range(100, 500))
		item.connect("collected", _on_item_collected)
		level.add_child(item)
	print("CasualMode: Spawning ", count, " items")

func _on_item_collected(type: String, value: int) -> void:
	_current_score += value
	print("CasualMode: Collected ", type, "! Score: ", _current_score)
	
	# Integrate with EconomyManager
	var economy_manager = ServiceRegistry.get_service("EconomyManager")
	if economy_manager:
		economy_manager.add_gold(value)
	
	# Optional: Emit signal to update UI
	# GlobalEventBus.emit_signal("score_updated", _current_score)

func process_mode(delta: float) -> void:
	# Casual mode logic (e.g. simple exploration)
	pass
