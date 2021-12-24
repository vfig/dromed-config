; Set the 'selected' face to 'tx3':
ifdef tx3 eval tx3 set_brush_tx %s
ifndef tx3 mprint tx3 is not set! use: 'set tx3 NNN'
ifndef tx3 play_schema hcermet
