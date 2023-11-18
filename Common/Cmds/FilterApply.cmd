; See FilterNext for explanation.

; Apply the current filter mode
ifdef FM0 mprint Filter 0: Terrain and Object brushes (Ctrl+V to reset)
ifdef FM0 ifndef FMA ifndef FMF ifndef FMR brush_filter 3216
ifdef FM0 ifdef FMA brush_filter 3280
ifdef FM0 ifdef FMF brush_filter 3472
ifdef FM0 ifdef FMR brush_filter 3728
ifdef FM1 mprint Filter 1: Terrain brushes (Ctrl+V to reset)
ifdef FM1 ifndef FMA ifndef FMF ifndef FMR brush_filter 3088
ifdef FM1 ifdef FMA brush_filter 3152
ifdef FM1 ifdef FMF brush_filter 3344
ifdef FM1 ifdef FMR brush_filter 3600
ifdef FM2 mprint Filter 2: Object brushes (Ctrl+V to reset)
ifdef FM2 ifndef FMA ifndef FMF ifndef FMR brush_filter 3200
ifdef FM2 ifdef FMA brush_filter 3264
ifdef FM2 ifdef FMF brush_filter 3456
ifdef FM2 ifdef FMR brush_filter 3712
ifdef FM3 mprint Filter 3: Light brushes (Ctrl+V to reset)
ifdef FM3 ifndef FMA ifndef FMF ifndef FMR brush_filter 3104
ifdef FM3 ifdef FMA brush_filter 3168
ifdef FM3 ifdef FMF brush_filter 3360
ifdef FM3 ifdef FMR brush_filter 3616
ifdef FM4 mprint Filter 4: Nothing (Ctrl+V to reset)
ifdef FM4 ifndef FMA ifndef FMF ifndef FMR brush_filter 3072
ifdef FM4 ifdef FMA brush_filter 3136
ifdef FM4 ifdef FMF brush_filter 3328
ifdef FM4 ifdef FMR brush_filter 3584
ifdef FMA mprint ... and Area brushes (Shift+A to toggle)
ifdef FMF mprint ... and Flow brushes (Shift+E to toggle)
ifdef FMR mprint ... and Room brushes (Shift+R to toggle)
