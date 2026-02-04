extends GutTest

func test_load_casual_mode():
	ModeManager.load_mode(ModeManager.GameMode.CASUAL)
	assert_not_null(ModeManager.current_mode, "Current mode should not be null")
	assert_true(ModeManager.current_mode is CasualMode, "Current mode should be CasualMode")
	assert_eq(ModeManager.current_mode.config.mode_id, "casual", "Config ID match")

func test_load_survival_mode():
	ModeManager.load_mode(ModeManager.GameMode.SURVIVAL)
	assert_not_null(ModeManager.current_mode, "Current mode should not be null")
	assert_true(ModeManager.current_mode is SurvivalMode, "Current mode should be SurvivalMode")
	assert_eq(ModeManager.current_mode.config.mode_id, "survival", "Config ID match")
