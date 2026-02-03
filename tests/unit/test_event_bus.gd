extends GutTest

func test_global_event_bus():
	var signal_received = false
	var received_payload = null
	
	# Connect locally to verify
	GlobalEventBus.connect("game_event", func(event_name, payload):
		if event_name == "test_event":
			signal_received = true
			received_payload = payload
	)
	
	GlobalEventBus.emit_signal("game_event", "test_event", {"data": 123})
	
	assert_true(signal_received, "Signal should be received")
	assert_eq(received_payload.data, 123, "Payload should match")
