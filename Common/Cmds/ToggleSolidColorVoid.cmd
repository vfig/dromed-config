unset tmp_disabling
ifdef Editor_NoInvalidCellCheck set tmp_disabling
; solid colour in void, solid+all wireframes render mode.
ifndef tmp_disabling set Editor_NoInvalidCellCheck
ifndef tmp_disabling set_mode 3
; wireframe in void, solid+selection render mode.
ifdef tmp_disabling unset Editor_NoInvalidCellCheck
ifdef tmp_disabling set_mode 2
unset tmp_disabling
