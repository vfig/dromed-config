ifdef danger_mode mprint "DANGER: In danger mode already: not saving again."
ifndef danger_mode mprint "DANGER: Saving as temp.mis/temp.gam."
ifndef danger_mode save_gamesys temp.gam
ifndef danger_mode set_gamesys temp.gam
ifndef danger_mode save_mission temp.mis
ifndef danger_mode set danger_mode 1
set game_mode_backup 0
game_mode
mprint "DANGER: Returning to edit mode will not restore the mission!"
game_message "DANGER: Returning to edit mode will not restore the mission!"
