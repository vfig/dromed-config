; See FilterNext for explanation.

; Toggle flow filter
unset FMx
ifdef FMF set FMx
ifndef FMF set FMF
ifdef FMx unset FMF
unset FMx
unset FMA
unset FMR

run .\cmds\FilterApply.cmd
