#collision
execute if score collided terf_states matches 1 if score @s terf_data_B matches 0 run function terf:entity/vehicle/mining_ship/collision
execute if score collided terf_states matches 1 if score @s terf_data_B matches 1 run scoreboard players set @s terf_data_A 0
scoreboard players operation @s terf_data_B = collided terf_states

execute if score @s terf_data_D matches 25000.. run function terf:entity/vehicle/mining_ship/damage_tickly_effects
#movement
data modify storage terf:temp args set value {arg1:"tp @s ^ ^ ^"}
execute store result storage terf:temp args.arg2 float 0.0001 run scoreboard players get @s terf_data_A
function datapipes_lib:require/with_args/2 with storage terf:temp args
scoreboard players operation temp terf_states = @s terf_data_A
scoreboard players operation temp terf_states /= 10 terf_states
execute if score @s terf_data_A matches 1.. run scoreboard players operation temp terf_states /= 5 terf_states

execute if score @s terf_data_A matches 1.. run scoreboard players add temp terf_states 1
execute if score @s terf_data_A matches ..-1 run scoreboard players remove temp terf_states 1
execute unless score @s terf_data_D matches 100000.. run scoreboard players operation @s terf_data_A -= temp terf_states

execute if score @s terf_data_D matches 100000.. at @s run tp @s ~ ~-.1 ~ ~ ~1
execute if score @s terf_data_D matches 100000.. run scoreboard players add @s terf_data_A 300

#movement sound
data modify storage terf:temp args set value {arg1:"playsound terf:alarms.alarm3 ambient @a[distance=0..] ~ ~ ~ 0.5 "}
execute if score @s terf_data_D matches 100000.. run data modify storage terf:temp args set value {arg1:"playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 1 "} 
scoreboard players operation temp terf_states = @s terf_data_A
scoreboard players add temp terf_states 10000
execute if score temp terf_states matches 40001.. run scoreboard players set temp terf_states 40000
execute store result storage terf:temp args.arg2 float 0.00005 run scoreboard players get temp terf_states
function datapipes_lib:require/with_args/2 with storage terf:temp args
execute if score @s terf_data_D matches 100000.. run function datapipes_lib:require/with_args/2 with storage terf:temp args
