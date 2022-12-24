; Cycle to the next filter mode (or start with mode 0 if none set yet)
ifdef FM5 unset FM5
ifdef FM4 set FM5 1
ifdef FM4 unset FM4
ifdef FM3 set FM4 1
ifdef FM3 unset FM3
ifdef FM2 set FM3 1
ifdef FM2 unset FM2
ifdef FM1 set FM2 1
ifdef FM1 unset FM1
ifdef FM0 set FM1 1
ifdef FM0 unset FM0
ifndef FM0 ifndef FM1 ifndef FM2 ifndef FM3 ifndef FM4 ifndef FM5 set FM0 1

; Apply the current filter mode
ifdef FM0 mprint Filter 0: Terrain and Object brushes (Ctrl+V to reset)
ifdef FM0 brush_filter 3216
ifdef FM1 mprint Filter 1: Area brushes (Ctrl+V to reset)
ifdef FM1 brush_filter 3136
ifdef FM2 mprint Filter 2: Terrain brushes (Ctrl+V to reset)
ifdef FM2 brush_filter 3088
ifdef FM3 mprint Filter 3: Object brushes (Ctrl+V to reset)
ifdef FM3 brush_filter 3200
ifdef FM4 mprint Filter 4: Flow brushes (Ctrl+V to reset)
ifdef FM4 brush_filter 3328
ifdef FM5 mprint Filter 5: Room brushes (Ctrl+V to reset)
ifdef FM5 brush_filter 3584
