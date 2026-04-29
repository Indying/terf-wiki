execute if block ~ ~ ~ #minecraft:air rotated ~ ~-0.06 positioned ^ ^ ^1 run return run function terf:entity/explosion/antimatter/raycast
execute if block ~ ~ ~ #terf:explosion_destroy_3 rotated ~ ~-0.06 positioned ^ ^ ^1 run function terf:entity/explosion/antimatter/raycast
fill ~-1 ~-1 ~-1 ~1 ~1 ~1 air replace #terf:explosion_destroy_3

execute if block ~ ~ ~ #terf:indestructible run return fail

scoreboard players set exposed terf_states 0
execute if block ~1 ~ ~ #minecraft:air run scoreboard players add exposed terf_states 1
execute if block ~-1 ~ ~ #minecraft:air run scoreboard players add exposed terf_states 1
execute if block ~ ~1 ~ #minecraft:air run scoreboard players add exposed terf_states 1
execute if block ~ ~-1 ~ #minecraft:air run scoreboard players add exposed terf_states 1
execute if block ~ ~ ~1 #minecraft:air run scoreboard players add exposed terf_states 1
execute if block ~ ~ ~-1 #minecraft:air run scoreboard players add exposed terf_states 1

execute if score exposed terf_states matches 1 if predicate datapipes_lib:chances/10 run return run setblock ~ ~ ~ air
execute if score exposed terf_states matches 2 if predicate datapipes_lib:chances/50 run return run setblock ~ ~ ~ air
execute if score exposed terf_states matches 3.. run return run setblock ~ ~ ~ air

execute if block ~ ~ ~ stone run return run setblock ~ ~ ~ cobbled_deepslate
execute if block ~ ~ ~ deepslate run setblock ~ ~ ~ blackstone
