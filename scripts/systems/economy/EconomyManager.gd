class_name EconomyManager
extends BaseManager

var gold: int = 0

func initialize() -> void:
	super.initialize()
	ServiceRegistry.register_service("EconomyManager", self)

func add_gold(amount: int) -> void:
	gold += amount
	print("Gold Added: ", amount, " Total: ", gold)
