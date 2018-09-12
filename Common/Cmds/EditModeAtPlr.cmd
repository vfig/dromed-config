set editorcam_from_game
edit_mode

; Warn about danger mode
ifdef danger_mode mprint "DANGER: Mission was processed for difficulty, must not save!"
ifdef game_mode_backup mprint "DANGER! DANGER! DANGER! Mission is in game state, must not save!"
