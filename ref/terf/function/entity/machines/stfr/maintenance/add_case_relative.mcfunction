data modify storage terf:temp args.maintenance set value []
data modify storage terf:temp args.maintenance append value "^1 ^1 ^4"
data modify storage terf:temp args.maintenance append value "^2 ^1 ^4"
data modify storage terf:temp args.maintenance append value "^3 ^1 ^3"
data modify storage terf:temp args.maintenance append value "^4 ^1 ^2"
data modify storage terf:temp args.maintenance append value "^4 ^1 ^1"
data modify storage terf:temp args.maintenance append value "^1 ^2 ^4"
data modify storage terf:temp args.maintenance append value "^1 ^3 ^3"
data modify storage terf:temp args.maintenance append value "^1 ^4 ^2"
data modify storage terf:temp args.maintenance append value "^1 ^4 ^1"
data modify storage terf:temp args.maintenance append value "^2 ^4 ^1"
data modify storage terf:temp args.maintenance append value "^3 ^3 ^1"
data modify storage terf:temp args.maintenance append value "^4 ^2 ^1"
data modify storage terf:temp args.maintenance append value "^3 ^2 ^2"
data modify storage terf:temp args.maintenance append value "^2 ^2 ^3"
data modify storage terf:temp args.maintenance append value "^2 ^3 ^2"

data modify storage terf:temp args merge value {arg1:"execute store result storage terf:temp args.arg2 int -1 run random value 1..",arg3:""}
execute store result storage terf:temp args.arg2 int 1 run data get storage terf:temp args.maintenance
function datapipes_lib:require/with_args/3 with storage terf:temp args

data modify storage terf:temp args merge value {arg1:"data modify storage terf:temp args.pos set from storage terf:temp args.maintenance[",arg3:"]"}
function datapipes_lib:require/with_args/3 with storage terf:temp args

data modify storage terf:temp args.machine_id set from entity @s data.terf.machine_id
#decide which quadrion of the case to put the maintenance on
execute store result score side terf_states run random value 1..8
execute if score side terf_states matches 1 rotated 0 0 run return run function terf:entity/machines/stfr/maintenance/summon_marker with storage terf:temp args
execute if score side terf_states matches 2 rotated 90 0 run return run function terf:entity/machines/stfr/maintenance/summon_marker with storage terf:temp args
execute if score side terf_states matches 3 rotated 180 0 run return run function terf:entity/machines/stfr/maintenance/summon_marker with storage terf:temp args
execute if score side terf_states matches 4 rotated 270 0 run return run function terf:entity/machines/stfr/maintenance/summon_marker with storage terf:temp args
execute if score side terf_states matches 5 rotated 0 180 run return run function terf:entity/machines/stfr/maintenance/summon_marker with storage terf:temp args
execute if score side terf_states matches 6 rotated 90 180 run return run function terf:entity/machines/stfr/maintenance/summon_marker with storage terf:temp args
execute if score side terf_states matches 7 rotated 180 180 run return run function terf:entity/machines/stfr/maintenance/summon_marker with storage terf:temp args
execute if score side terf_states matches 8 rotated 270 180 run function terf:entity/machines/stfr/maintenance/summon_marker with storage terf:temp args
