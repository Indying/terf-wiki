execute if score @s datapipes_lib_power_storage matches ..594 run scoreboard players add @s datapipes_lib_power_storage 6

#particles
execute if block ~ ~4 ~ air run particle minecraft:campfire_signal_smoke ~ ~2.6 ~ 0 0.3 0 1 0 force
execute as @s[tag=!terf_dieselgen_case] run function terf:entity/machines/diesel_generator/case_broken

#sound
execute if score @s terf_data_A matches 99 run return run playsound minecraft:block.piston.contract master @a[distance=0..] ~ ~ ~ 0.3 2
data modify storage terf:temp args.arg1 set value 'playsound minecraft:block.piston.contract master @a[distance=0..] ~ ~ ~ 0.3 '
execute as @s[tag=!terf_dieselgen_case] run data modify storage terf:temp args.arg1 set value 'playsound minecraft:item.mace.smash_air master @a[distance=0..] ~ ~ ~ 3 '
execute store result storage terf:temp args.arg2 float 0.02 run scoreboard players get @s terf_data_A
function datapipes_lib:require/with_args/2 with storage terf:temp args
