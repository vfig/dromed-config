; Set the 'selected' face to 'tx5':
ifdef tx5 eval tx5 set_brush_tx %s
ifndef tx5 mprint tx5 is not set! use: 'set tx5 NNN'
ifndef tx5 play_schema hcermet
