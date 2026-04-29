scoreboard players add length terf_states 1
scoreboard players remove terminated terf_states 1
execute if score terminated terf_states matches ..0 run return fail

execute if score mode terf_states matches 0 run particle minecraft:electric_spark ^ ^ ^-1 ^ ^ ^1500000000 0.000000001 0
execute if score mode terf_states matches 0 run particle minecraft:electric_spark ~ ~ ~ ^ ^ ^-1500000000 0.000000001 0
execute align xyz as @a[dx=0,dy=0,dz=0] run function terf:entity/machines/hadron_collider/ring/damage_player

execute positioned ^1 ^ ^ if predicate terf:is_hadron_wall positioned ^-2 ^ ^ if predicate terf:is_hadron_wall positioned ^1 ^1 ^ if predicate terf:is_hadron_wall positioned ^ ^-2 ^ if predicate terf:is_hadron_wall positioned ^ ^1 ^1 run return run function terf:entity/machines/hadron_collider/ring/raycast
execute if block ~ ~ ~ light[level=0] run return run function terf:entity/machines/hadron_collider/ring/special_case

execute positioned ^ ^ ^1 unless predicate terf:is_hadron_wall run return run execute if score mode terf_states matches 0 run function terf:entity/machines/hadron_collider/ring/shoot_beam

execute positioned ^-1 ^ ^ unless predicate terf:is_hadron_wall positioned ^1 ^1 ^ if predicate terf:is_hadron_wall positioned ^ ^-2 ^ if predicate terf:is_hadron_wall positioned ^1 ^1 ^ if predicate terf:is_hadron_wall positioned ^-1 ^ ^ rotated ~90 0 positioned ^ ^ ^1 run return run function terf:entity/machines/hadron_collider/ring/raycast
execute positioned ^1 ^ ^ unless predicate terf:is_hadron_wall positioned ^-1 ^1 ^ if predicate terf:is_hadron_wall positioned ^ ^-2 ^ if predicate terf:is_hadron_wall positioned ^-1 ^1 ^ if predicate terf:is_hadron_wall positioned ^1 ^ ^ rotated ~-90 0 positioned ^ ^ ^1 run return run function terf:entity/machines/hadron_collider/ring/raycast

execute positioned ^ ^-1 ^ unless predicate terf:is_hadron_wall positioned ^ ^2 ^ if predicate terf:is_hadron_wall positioned ^1 ^-1 ^ if predicate terf:is_hadron_wall positioned ^-2 ^ ^ if predicate terf:is_hadron_wall positioned ^1 ^ ^ rotated ~ ~90 positioned ^ ^ ^1 run return run function terf:entity/machines/hadron_collider/ring/raycast
execute positioned ^ ^1 ^ unless predicate terf:is_hadron_wall positioned ^ ^-2 ^ if predicate terf:is_hadron_wall positioned ^1 ^1 ^ if predicate terf:is_hadron_wall positioned ^-2 ^ ^ if predicate terf:is_hadron_wall positioned ^1 ^ ^ rotated ~ ~-90 positioned ^ ^ ^1 run return run function terf:entity/machines/hadron_collider/ring/raycast

execute if score mode terf_states matches 0 run function terf:entity/machines/hadron_collider/ring/explosion