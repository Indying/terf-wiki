execute if block ~ ~ ~ minecraft:observer[facing=south] run scoreboard players set axis terf_states 3
execute if block ~ ~ ~ minecraft:observer[facing=north] run scoreboard players set axis terf_states 3
execute if block ~ ~ ~ minecraft:observer[facing=up] run scoreboard players set axis terf_states 2
execute if block ~ ~ ~ minecraft:observer[facing=down] run scoreboard players set axis terf_states 2
execute if block ~ ~ ~ minecraft:observer[facing=west] run scoreboard players set axis terf_states 1
execute if block ~ ~ ~ minecraft:observer[facing=east] run scoreboard players set axis terf_states 1

execute if block ~ ~ ~ minecraft:observer[facing=south] rotated 180 0 positioned ^ ^ ^1 run return run function terf:entity/machines/laser/beam/step with storage terf:temp args
execute if block ~ ~ ~ minecraft:observer[facing=north] rotated 0 0 positioned ^ ^ ^1 run return run function terf:entity/machines/laser/beam/step with storage terf:temp args
execute if block ~ ~ ~ minecraft:observer[facing=west] rotated -90 0 positioned ^ ^ ^1 run return run function terf:entity/machines/laser/beam/step with storage terf:temp args
execute if block ~ ~ ~ minecraft:observer[facing=east] rotated 90 0 positioned ^ ^ ^1 run return run function terf:entity/machines/laser/beam/step with storage terf:temp args
execute if block ~ ~ ~ minecraft:observer[facing=up] rotated 0 90 positioned ^ ^ ^1 run return run function terf:entity/machines/laser/beam/step with storage terf:temp args
execute if block ~ ~ ~ minecraft:observer[facing=down] rotated 0 -90 positioned ^ ^ ^1 run return run function terf:entity/machines/laser/beam/step with storage terf:temp args
