data modify storage terf:temp args.maintenance set value []

data modify storage terf:temp args.maintenance append value "^ ^ ^12"
data modify storage terf:temp args.maintenance append value "^ ^ ^13"

data modify storage terf:temp args.maintenance append value "^1 ^-1 ^5"
data modify storage terf:temp args.maintenance append value "^-1 ^1 ^5"
data modify storage terf:temp args.maintenance append value "^-1 ^-1 ^5"

data modify storage terf:temp args.maintenance append value "^1 ^1 ^7"
data modify storage terf:temp args.maintenance append value "^1 ^-1 ^7"
data modify storage terf:temp args.maintenance append value "^-1 ^1 ^7"
data modify storage terf:temp args.maintenance append value "^-1 ^-1 ^7"
data modify storage terf:temp args.maintenance append value "^ ^1 ^7"
data modify storage terf:temp args.maintenance append value "^ ^-1 ^7"
data modify storage terf:temp args.maintenance append value "^1 ^ ^7"
data modify storage terf:temp args.maintenance append value "^-1 ^ ^7"

data modify storage terf:temp args.maintenance append value "^ ^1 ^6"
data modify storage terf:temp args.maintenance append value "^ ^-1 ^6"
data modify storage terf:temp args.maintenance append value "^1 ^ ^6"
data modify storage terf:temp args.maintenance append value "^-1 ^ ^6"
data modify storage terf:temp args.maintenance append value "^1 ^1 ^6"
data modify storage terf:temp args.maintenance append value "^1 ^-1 ^6"
data modify storage terf:temp args.maintenance append value "^-1 ^1 ^6"
data modify storage terf:temp args.maintenance append value "^-1 ^-1 ^6"

data modify storage terf:temp args.maintenance append value "^2 ^ ^4"
data modify storage terf:temp args.maintenance append value "^-2 ^ ^4"
data modify storage terf:temp args.maintenance append value "^ ^2 ^4"
data modify storage terf:temp args.maintenance append value "^ ^-2 ^4"

data modify storage terf:temp args.maintenance append value "^2 ^ ^5"
data modify storage terf:temp args.maintenance append value "^-2 ^ ^5"
data modify storage terf:temp args.maintenance append value "^ ^2 ^5"
data modify storage terf:temp args.maintenance append value "^ ^-2 ^5"

data modify storage terf:temp args.maintenance append value "^1 ^ ^8"
data modify storage terf:temp args.maintenance append value "^-1 ^ ^"
data modify storage terf:temp args.maintenance append value "^ ^1 ^8"
data modify storage terf:temp args.maintenance append value "^ ^-1 ^8"

data modify storage terf:temp args.maintenance append value "^2 ^ ^3"
data modify storage terf:temp args.maintenance append value "^-2 ^ ^3"
data modify storage terf:temp args.maintenance append value "^ ^2 ^3"
data modify storage terf:temp args.maintenance append value "^ ^-2 ^3"

data modify storage terf:temp args.maintenance append value "^1 ^ ^11"
data modify storage terf:temp args.maintenance append value "^-1 ^ ^11"
data modify storage terf:temp args.maintenance append value "^ ^1 ^11"
data modify storage terf:temp args.maintenance append value "^ ^-1 ^11"

data modify storage terf:temp args.maintenance append value "^1 ^ ^12"
data modify storage terf:temp args.maintenance append value "^-1 ^ ^12"
data modify storage terf:temp args.maintenance append value "^ ^1 ^12"
data modify storage terf:temp args.maintenance append value "^ ^-1 ^12"

data modify storage terf:temp args.maintenance append value "^1 ^ ^13"
data modify storage terf:temp args.maintenance append value "^-1 ^ ^13"
data modify storage terf:temp args.maintenance append value "^ ^1 ^13"
data modify storage terf:temp args.maintenance append value "^ ^-1 ^13"

data modify storage terf:temp args merge value {arg1:"execute store result storage terf:temp args.arg2 int -1 run random value 1..",arg3:""}
execute store result storage terf:temp args.arg2 int 1 run data get storage terf:temp args.maintenance
function datapipes_lib:require/with_args/3 with storage terf:temp args

data modify storage terf:temp args merge value {arg1:"data modify storage terf:temp args.pos set from storage terf:temp args.maintenance[",arg3:"]"}
function datapipes_lib:require/with_args/3 with storage terf:temp args

data modify storage terf:temp args.machine_id set from entity @s data.terf.machine_id
execute if score component terf_states matches 1 rotated 0 -90 run return run function terf:entity/machines/stfr/maintenance/summon_marker with storage terf:temp args
execute if score component terf_states matches 2 rotated 0 0 run return run function terf:entity/machines/stfr/maintenance/summon_marker with storage terf:temp args
execute if score component terf_states matches 3 rotated -90 0 run return run function terf:entity/machines/stfr/maintenance/summon_marker with storage terf:temp args
execute if score component terf_states matches 4 rotated 180 0 run return run function terf:entity/machines/stfr/maintenance/summon_marker with storage terf:temp args
execute if score component terf_states matches 5 rotated 90 0 run return run function terf:entity/machines/stfr/maintenance/summon_marker with storage terf:temp args
execute if score component terf_states matches 6 rotated 0 90 run function terf:entity/machines/stfr/maintenance/summon_marker with storage terf:temp args
