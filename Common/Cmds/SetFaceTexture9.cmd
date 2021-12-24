; Set the 'selected' face to 'tx9':
ifdef tx9 eval tx9 set_brush_tx %s
ifndef tx9 mprint tx9 is not set! use: 'set tx9 NNN'
ifndef tx9 play_schema hcermet
