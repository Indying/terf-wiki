advancement revoke @s only terf:internal/cd_shrink_ray

#execute if entity @s[name=Ragn4Rockx] run return run title @s actionbar "shrink rays are unavailable for you because you abused a bug"

scoreboard players reset temp terf_states
scoreboard players reset succeeded terf_states
scoreboard players set mode terf_states 0
execute if predicate datapipes_lib:pressing_sneak run scoreboard players set mode terf_states 1
execute if score mode terf_states matches 0 positioned ^.105 ^-.055 ^.12 run function terf:entity/player/tool/shrink_ray/shrink
execute if score mode terf_states matches 1 positioned ^.105 ^-.055 ^.12 run function terf:entity/player/tool/shrink_ray/grow

execute if score succeeded terf_states matches 0 run title @s actionbar {"text":"This entity cannot be scaled","color":"aqua"}

execute unless score temp terf_states = temp terf_states run return fail
data modify storage terf:temp args set value {arg1:'title @s actionbar {"text":"Target scale: ',arg3:'x","color":"aqua"}'}
scoreboard players add temp terf_states 1000
execute store result storage terf:temp args.arg2 double 0.001 run scoreboard players get temp terf_states
function datapipes_lib:require/with_args/3 with storage terf:temp args