data modify storage terf:temp args set value {arg1:"playsound terf:explosion.crash ambient @a[distance=0..] ~ ~ ~ 0.5 "}
scoreboard players operation temp terf_states = @s terf_data_A
execute if score temp terf_states matches 20001.. run scoreboard players set temp terf_states 20000
execute store result storage terf:temp args.arg2 float 0.0001 run scoreboard players get temp terf_states
execute if score @s terf_data_A matches 1.. run function datapipes_lib:require/with_args/2 with storage terf:temp args

scoreboard players operation temp terf_states /= 500 terf_states
scoreboard players add temp terf_states 10
execute on passengers as @s[type=minecraft:interaction,tag=terf_click_detector] on passengers run scoreboard players operation @s[type=minecraft:player] terf_data_P += temp terf_states

scoreboard players operation temp terf_states = @s terf_data_A
scoreboard players operation temp terf_states /= 30 terf_states
scoreboard players operation temp terf_states *= @s terf_data_A
scoreboard players operation temp terf_states /= 300 terf_states
scoreboard players remove temp terf_states 1000
execute if score temp terf_states matches 1001.. run scoreboard players operation @s terf_data_D += temp terf_states

execute if score @s terf_data_D matches 100000.. run function terf:entity/vehicle/mining_ship/explode

scoreboard players operation @s terf_data_A /= -1 terf_states