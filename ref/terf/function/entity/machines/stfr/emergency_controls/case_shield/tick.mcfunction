playsound terf:caseshield master @a[distance=0..] ~ ~ ~ 5 1

scoreboard players set raytermination terf_states 0
data modify storage terf:temp args set value {command:'execute rotated ~ ~-90 run function terf:entity/machines/stfr/emergency_controls/case_shield/raycast'}
execute store result storage terf:temp args.angle float 0.9463738346 run scoreboard players get @s terf_data_T
function datapipes_lib:require/run_with_angle with storage terf:temp args
scoreboard players remove @s terf_data_Ad 1100

execute as @s[tag=terf_case] run tag @s remove terf_case_shield
execute if score @s terf_data_Ad matches ..1000 run tag @s remove terf_case_shield
execute unless score @s terf_data_A matches 3 run tag @s remove terf_case_shield
