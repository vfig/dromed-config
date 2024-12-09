; The `clear_world` command resets the `world` variable, but `new_world`
; (which also reloads the gamesys) does not. So we clear it here.
unset world
new_world
