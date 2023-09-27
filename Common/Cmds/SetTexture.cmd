;; Quick-set textures, using 'tx', 'tx2', tx3'
;; Use e.g. 'set tx 99' to choose textures.
;; Note: this does *not* reset uvs!

; Reset all faces and set default texture to 'tx'
ifdef tx reset_brush_tx
ifdef tx eval tx set_brush_def_tx %s
ifdef tx eval tx mprint default tx is %s
ifndef tx mprint 'set tx NNN' to change default tx.

; Set the 'bottom' face to 'tx2':
ifdef tx2 cycle_face 999
ifdef tx2 cycle_face -1
ifdef tx2 eval tx2 set_brush_tx %s
ifdef tx2 eval tx2 mprint bottom tx is %s
ifndef tx2 mprint 'set tx2 NNN' to change bottom tx.

; Set the 'top' face to 'tx3':
ifdef tx3 cycle_face 999
ifdef tx3 cycle_face -1
ifdef tx3 cycle_face -1
ifdef tx3 eval tx3 set_brush_tx %s
ifdef tx3 eval tx3 mprint top tx is %s
ifndef tx3 mprint 'set tx3 NNN' to change top tx.
