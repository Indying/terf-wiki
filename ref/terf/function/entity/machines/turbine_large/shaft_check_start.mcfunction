tag @s remove terf_outputed
data remove entity @s data.power

scoreboard players set z terf_states -1
execute positioned ^ ^ ^-1 run function terf:entity/machines/turbine_large/shaft_check

#if it already found a generator, return
execute if entity @s[tag=terf_outputed] run return fail
scoreboard players set z terf_states 1
execute rotated ~180 ~ positioned ^ ^ ^-1 run function terf:entity/machines/turbine_large/shaft_check
