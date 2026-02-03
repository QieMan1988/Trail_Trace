class_name GlobalEventBus
extends Node

# Autoload: GlobalEventBus

# System Events
@warning_ignore("unused_signal")
signal system_ready(system_name: String)

# Mode Events
@warning_ignore("unused_signal")
signal mode_enter(mode_name: String)
@warning_ignore("unused_signal")
signal mode_exit(mode_name: String)

# Gameplay Events
@warning_ignore("unused_signal")
signal level_started(level_id: String)
@warning_ignore("unused_signal")
signal level_completed(level_id: String)
@warning_ignore("unused_signal")
signal player_died
