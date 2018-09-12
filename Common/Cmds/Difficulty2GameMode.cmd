ifdef danger_mode mprint "DANGER: In danger mode already: not saving again."
ifndef danger_mode mprint "DANGER: Saving as temp.mis/temp.gam."
ifndef danger_mode save_gamesys temp.gam
ifndef danger_mode set_gamesys temp.gam
ifndef danger_mode save_mission temp.mis
ifndef danger_mode set danger_mode 1
quest_create_mis difficulty,2
process_difficulty
game_mode
mprint "DANGER: Hacked the mission into Expert difficulty!"
game_message "DANGER: Hacked the mission into Expert difficulty!"
