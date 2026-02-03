extends Node

# Autoload: ServiceRegistry
# Simple Service Locator Pattern

var _services: Dictionary = {}

func register_service(interface_name: String, instance: Object) -> void:
	if _services.has(interface_name):
		push_warning("Service already registered: " + interface_name)
	_services[interface_name] = instance
	print("Service Registered: ", interface_name)

func get_service(interface_name: String) -> Object:
	if not _services.has(interface_name):
		push_error("Service not found: " + interface_name)
		return null
	return _services[interface_name]

func unregister_service(interface_name: String) -> void:
	if _services.has(interface_name):
		_services.erase(interface_name)
