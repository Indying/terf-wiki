execute store result storage terf:temp args.arg1 int 1 run random value 0..17
execute store result storage terf:temp args.arg2 int 1 run random value 0..3
execute store result storage terf:temp args.arg3 int 1 run random value 0..17
execute store result storage terf:temp args.arg4 int 1 run random value 0..3
function terf:entity/machines/stfr/states/shutdown_failure/panel_glitch_args with storage terf:temp args