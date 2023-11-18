; `brush_filter` command takes an int parameter which is the filter mask.
; The "everything" filter mask is 0x0FF0 (4080); to disable certain brushes,
; clear their bits as per the table below. It is important that the upper
; two bits of the filter mask remain set, as dromed checks if all 16 bits are
; set when deciding if any filters are active or not.
;
;   - 0x010: Terrain
;   - 0x020: Light
;   - 0x040: Area
;   - 0x080: Object
;   - 0x100: Flow
;   - 0x200: Room
;
; This script uses the config variables FM* (Filter Mask) to decide which
; filter mode it is in; it has a primary mode which is cycled through, and
; a secondary mode which is toggled as needed.
;
; Primary mode:
;
; - FM0: show Terrain and Objects
; - FM1: show Terrain only
; - FM2: show Objects only
; - FM3: show Lights only
; - FM4: show secondary only (if any secondary is active)
;
; Secondary mode:
;
; - FMA: also show Area brushes
; - FMR: also show Room brushes
; - FMF: also show Flow brushes
; - FMx: temporary flag while toggling.

; Cycle to the next filter mode (or start with mode 0 if none set yet)
ifdef FM4 unset FM4
ifdef FM3 ifdef FMA set FM4 1
ifdef FM3 ifdef FMF set FM4 1
ifdef FM3 ifdef FMR set FM4 1
ifdef FM3 unset FM3
ifdef FM2 set FM3 1
ifdef FM2 unset FM2
ifdef FM1 set FM2 1
ifdef FM1 unset FM1
ifdef FM0 set FM1 1
ifdef FM0 unset FM0
ifndef FM0 ifndef FM1 ifndef FM2 ifndef FM3 ifndef FM4 set FM0 1

run .\cmds\FilterApply.cmd
