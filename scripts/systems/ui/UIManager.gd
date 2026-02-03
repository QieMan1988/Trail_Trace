class_name UIManager
extends BaseManager

func initialize() -> void:
	super.initialize()
	ServiceRegistry.register_service("UIManager", self)

func show_screen(screen_name: String) -> void:
	print("Showing Screen: ", screen_name)
