scoreboard players set temp terf_states 1
scoreboard players add @s terf_data_C 1

data modify storage terf:temp args set value {arg1:'execute align xyz run tp @s ~',arg3:' ~',arg5:' ~'}
execute store result storage terf:temp args.arg2 float 0.0001 run random value 0..9999
execute store result storage terf:temp args.arg4 float 0.0001 run random value 0..9999
execute store result storage terf:temp args.arg6 float 0.0001 run random value 0..9999
function datapipes_lib:require/with_args/6 with storage terf:temp args

execute unless score @s terf_data_C matches 5.. run return run playsound minecraft:block.anvil.use player @a[distance=0..] ~ ~ ~ 1 2
playsound minecraft:block.anvil.land player @a[distance=0..] ~ ~ ~ 1 2
function terf:entity/machines/stfr/maintenance/fix_maintenance
