; See FilterNext for explanation.

; Toggle area filter
unset FMx
ifdef FMA set FMx
ifndef FMA set FMA
ifdef FMx unset FMA
unset FMx
unset FMF
unset FMR

run .\cmds\FilterApply.cmd
