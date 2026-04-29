execute if score @s terf_data_C matches 1 run return fail

#effects
scoreboard players add @s terf_data_T 1
effect give @s minecraft:blindness 2 0 true
effect give @s minecraft:poison 3 0 true
effect give @s minecraft:weakness 3 255 true
effect give @s minecraft:mining_fatigue 3 255 true
effect give @s minecraft:slowness 3 143 true
effect give @s minecraft:water_breathing 3 255 true

#dont continue if not a player
execute unless entity @s[type=minecraft:player] run return fail
scoreboard players add @s terf_data_A 20

summon marker ~ ~ ~ {UUID:[I;1100010,1110010,1101111,1100110]}
execute store result score x terf_states run data get entity 0010c8ea-0010-effa-0010-cd370010c94e Pos[0] 100
execute store result score z terf_states run data get entity 0010c8ea-0010-effa-0010-cd370010c94e Pos[2] 100
kill 0010c8ea-0010-effa-0010-cd370010c94e

data modify storage terf:temp args set value {x:0,y:0,z:0}
execute store result storage terf:temp args.x int -1 run scoreboard players operation x terf_states -= x2 terf_states
execute store result storage terf:temp args.z int -1 run scoreboard players operation z terf_states -= z2 terf_states

function datapipes_lib:require/calculate_distance with storage terf:temp args

execute store result score distance terf_states run data get storage datapipes_lib:temp output 10

scoreboard players add distance terf_states 1

scoreboard players set rad_remove_adder terf_states 300000
scoreboard players operation rad_remove_adder terf_states /= distance terf_states
scoreboard players operation rad_remove_adder terf_states /= 100 terf_states

execute if score distance terf_states matches 10.. run scoreboard players operation temp2 terf_states += rad_remove_adder terf_states
