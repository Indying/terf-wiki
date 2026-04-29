execute store result storage terf:temp args.x float 0.01 run scoreboard players get temp terf_states
data modify storage terf:temp args.y set value 0f
execute store result storage terf:temp args.z float 0.01 run scoreboard players get temp2 terf_states
function datapipes_lib:require/calculate_distance with storage terf:temp args
execute store result score temp4 terf_states run data get storage datapipes_lib:temp output 100

execute if score temp3 terf_states matches 1 if score temp4 terf_states <= radius terf_states run forceload add ~ ~
execute if score temp3 terf_states matches 0 if score temp4 terf_states <= radius terf_states run forceload remove ~ ~

scoreboard players add temp terf_states 16
execute if score temp terf_states <= radius terf_states positioned ~16 ~ ~ run return run function terf:entity/machines/stfr/states/detonation/at_chunks with storage terf:temp args

$scoreboard players set temp terf_states -$(radius)
scoreboard players add temp2 terf_states 16
$execute if score temp2 terf_states <= radius terf_states positioned ~-$(radius) ~ ~ positioned ~-$(radius) ~ ~ positioned ~ ~ ~16 run function terf:entity/machines/stfr/states/detonation/at_chunks with storage terf:temp args
