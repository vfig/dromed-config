; Reload the current mission
ifndef world mprint Not saved, cannot reload.
ifdef world eval world load_file %s
