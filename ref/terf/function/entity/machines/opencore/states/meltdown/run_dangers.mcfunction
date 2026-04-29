data modify storage terf:temp oc_args.command set from storage terf:temp oc_args.array[0]
function datapipes_lib:require/complex_function/1 with storage terf:temp oc_args
data remove storage terf:temp oc_args.array[0]
execute if data storage terf:temp oc_args.array[0] run function terf:entity/machines/opencore/states/meltdown/run_dangers