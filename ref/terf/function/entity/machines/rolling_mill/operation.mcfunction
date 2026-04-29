scoreboard players add @s terf_data_A 1
execute if score @s terf_data_A > @s terf_data_B positioned ^ ^1 ^2 run function terf:entity/machines/rolling_mill/complete with entity @s data.terf.stored_recipe
scoreboard players remove @s datapipes_lib_power_storage 6

scoreboard players operation temp terf_states = @s terf_data_A
scoreboard players operation temp terf_states %= 40 terf_states
execute if score temp terf_states matches 1 run playsound terf:metal_pipe master @a[distance=0..] ~ ~ ~ 0.5

scoreboard players operation temp terf_states = @s terf_data_A
data modify storage terf:temp args set value {arg1:'particle minecraft:electric_spark ^ ^1.5 ^',arg3:' 0.15 0 0.15 0 10 force'}
$execute store result storage terf:temp args.arg2 float $(pvel) run scoreboard players get temp terf_states
execute positioned ^ ^ ^-2 run function datapipes_lib:require/with_args/3 with storage terf:temp args