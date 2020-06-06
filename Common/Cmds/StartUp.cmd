; Display Solid World + selected brush in 3d Viewer
;set_mode 6

; Display Solid + all wireframes in 3d Viewer
set_mode 3

; Use z-testing for wireframes (useful for mode 7)
toggle_wire_zbuffer 1

; Light Terrain and objects
toggle_lighting

; Player begins at editor camera position when entering game mode
persistent_player_pos

; AI unware of player
ai_aware_of_player

; Draw in-game AI path stuff
;ai_draw

; Ignore filters by default when portalizing (Newdark)
set_ignore_filters 1

; Load template on startup?
;load_file levels\template.mis

; Autoreload book strings (Newdark)
toggle_book_autoreload

; start with grid scale 13
grid_abs_scale 0.5

; initial quick texture indices (see SetTexture.cmd)
;set tx 0
;set tx2 -1
;set tx3 -1
