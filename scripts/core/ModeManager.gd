extends Node

# Autoload: ModeManager

signal mode_changed(new_mode: BaseMode)

enum GameMode {
	NONE,
	CASUAL,
	SURVIVAL
}

var current_mode: BaseMode
var mode_container: Node

func _ready() -> void:
	# Create a container for modes if not exists
	mode_container = Node.new()
	mode_container.name = "ModeContainer"
	add_child(mode_container)

func load_mode(mode_type: GameMode) -> void:
	if current_mode:
		current_mode.exit()
		current_mode = null
	
	match mode_type:
		GameMode.CASUAL:
			current_mode = CasualMode.new()
		GameMode.SURVIVAL:
			current_mode = SurvivalMode.new()
		_:
			push_error("Unknown mode type")
			return
	
	if current_mode:
		mode_container.add_child(current_mode)
		current_mode.enter()
		emit_signal("mode_changed", current_mode)

func _process(delta: float) -> void:
	if current_mode:
		current_mode.process_mode(delta)
