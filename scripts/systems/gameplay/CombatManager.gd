class_name CombatManager
extends BaseManager

## Handles combat logic, damage calculations, and turn management (if applicable)

signal combat_started(participants: Array)
signal combat_ended(result: Dictionary)

func _ready() -> void:
	super._ready()
	_logger_name = "CombatManager"

func initialize() -> void:
	super.initialize()
	print_debug("CombatManager initialized")

func resolve_attack(attacker: Node, target: Node) -> void:
	# TODO: Implement damage logic
	print_debug("Resolving attack from ", attacker, " to ", target)
	emit_signal("combat_ended", {"winner": attacker})
