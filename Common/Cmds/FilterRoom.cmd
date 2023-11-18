; See FilterNext for explanation.

; Toggle room filter
unset FMx
ifdef FMR set FMx
ifndef FMR set FMR
ifdef FMx unset FMR
unset FMx
unset FMA
unset FMF

run .\cmds\FilterApply.cmd
