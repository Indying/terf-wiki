scoreboard players remove terminated terf_states 1
execute if score terminated terf_states matches ..0 run return fail

execute if block ~ ~ ~ minecraft:observer run return run function terf:entity/machines/laser/beam/in_observer
execute if block ~ ~ ~ #terf:glass run function terf:entity/machines/laser/beam/in_glass

execute unless block ~ ~ ~ #terf:laser_can_go_through run return run function terf:entity/machines/laser/beam/hit_block
function terf:entity/machines/laser/beam/macro with storage terf:temp args

execute positioned ^ ^ ^1 run function terf:entity/machines/laser/beam/step
