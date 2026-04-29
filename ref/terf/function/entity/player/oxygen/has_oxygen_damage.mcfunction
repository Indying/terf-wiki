execute store result storage terf:temp args.dec int 0.5 run scoreboard players get @s terf_data_Q
function terf:entity/player/oxygen/has_oxygen_damage_args with storage terf:temp args

execute if score @s terf_data_Q matches 512.. run damage @s 10 terf:no_oxygen
execute unless entity @s[tag=terf_cant_breathe,tag=!terf_in_air] run scoreboard players remove @s terf_data_Q 1
