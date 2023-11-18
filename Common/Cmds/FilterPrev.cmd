; See FilterNext for explanation.

; Cycle to the previous filter mode (or start with mode 3 if none set yet)
ifdef FM0 unset FM0
ifdef FM1 set FM0 1
ifdef FM1 unset FM1
ifdef FM2 set FM1 1
ifdef FM2 unset FM2
ifdef FM3 set FM2 1
ifdef FM3 unset FM3
ifdef FM4 set FM3 1
ifdef FM4 unset FM4
ifndef FM0 ifndef FM1 ifndef FM2 ifndef FM3 ifndef FM4 ifndef FMA ifndef FMF ifndef FMR set FM3 1
ifndef FM0 ifndef FM1 ifndef FM2 ifndef FM3 ifndef FM4 ifdef FMA set FM4 1
ifndef FM0 ifndef FM1 ifndef FM2 ifndef FM3 ifndef FM4 ifdef FMF set FM4 1
ifndef FM0 ifndef FM1 ifndef FM2 ifndef FM3 ifndef FM4 ifdef FMR set FM4 1

run .\cmds\FilterApply.cmd
