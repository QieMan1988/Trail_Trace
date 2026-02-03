class_name BaseManager
extends Node

var _logger_name: String = "BaseManager"

# Interface for all system managers

func _ready() -> void:
	# Auto-register if needed, or let Boot scene handle it
	pass

func initialize() -> void:
	print(name, " Initialized")

func reset() -> void:
	pass
