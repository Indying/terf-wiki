scoreboard players add length terf_states 1
execute if score length terf_states matches 200.. run return fail
execute unless block ~ ~ ~ #minecraft:air run return fail
execute positioned ^ ^ ^-1 run function terf:entity/meteor/spawn_space_raycast