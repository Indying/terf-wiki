scoreboard players remove terminated terf_states 1
execute if score terminated terf_states matches ..0 run return fail
execute if block ~ ~ ~ minecraft:diamond_block run return run function terf:entity/machines/stasis_laser/at_laser

execute if block ~ ~ ~ minecraft:piston[facing=up] positioned ~ ~1 ~ run return run function terf:entity/machines/stasis_laser/cable_checks
execute if block ~ ~ ~ minecraft:piston[facing=down] positioned ~ ~-1 ~ run return run function terf:entity/machines/stasis_laser/cable_checks
execute if block ~ ~ ~ minecraft:piston[facing=south] positioned ~ ~ ~1 run return run function terf:entity/machines/stasis_laser/cable_checks
execute if block ~ ~ ~ minecraft:piston[facing=north] positioned ~ ~ ~-1 run return run function terf:entity/machines/stasis_laser/cable_checks
execute if block ~ ~ ~ minecraft:piston[facing=east] positioned ~1 ~ ~ run return run function terf:entity/machines/stasis_laser/cable_checks
execute if block ~ ~ ~ minecraft:piston[facing=west] positioned ~-1 ~ ~ run function terf:entity/machines/stasis_laser/cable_checks
