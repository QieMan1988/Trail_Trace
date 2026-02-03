class_name CollectibleItem
extends Area2D

signal collected(item_type: String, value: int)

@export var item_type: String = "coin"
@export var value: int = 10

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body is PlayerCharacter:
		emit_signal("collected", item_type, value)
		queue_free()
