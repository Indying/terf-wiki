scoreboard players add @s terf_data_A 1
execute if score @s terf_data_A matches 255.. run return run kill @s
execute store result entity @s item.components.minecraft:custom_model_data.colors[0] int 1 run scoreboard players get @s terf_data_A

#the shockwave travels 1.9 blocks in 1 tick
scoreboard players operation temp terf_states = @s terf_data_A
scoreboard players remove temp terf_states 10

execute store result storage terf:temp args.prev_distance float 1.9 run scoreboard players get temp terf_states
execute store result storage terf:temp args.distance float 1.9 run scoreboard players get @s terf_data_A
function terf:entity/explosion/seismic/args with storage terf:temp args