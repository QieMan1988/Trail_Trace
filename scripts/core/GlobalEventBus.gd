extends Node

# Autoload: GlobalEventBus

# System Events
signal system_ready(system_name: String)

# Mode Events
signal mode_enter(mode_name: String)
signal mode_exit(mode_name: String)

# Gameplay Events
signal level_started(level_id: String)
signal level_completed(level_id: String)
signal player_died
