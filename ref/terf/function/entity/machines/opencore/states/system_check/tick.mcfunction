tag @s remove terf_highbeep
tag @s remove terf_lowbeep

execute unless score @s terf_data_E matches 97.. if predicate datapipes_lib:chances/50 run tag @s add terf_highbeep
execute unless score @s terf_data_E matches 97.. if predicate datapipes_lib:chances/10 run tag @s add terf_lowbeep

execute as @s[tag=terf_lowbeep] run scoreboard players add @s terf_data_E 2

execute as @s[tag=terf_lowbeep] if score @s[tag=terf_allsystemsworking] terf_data_E matches 97.. run function terf:entity/machines/opencore/broadcast {level:0,text:'{"text":"System Check Complete! ","color":"aqua"},{"text":"No Errors Detected.","color":"dark_aqua"}'}
execute as @s[tag=terf_lowbeep] if score @s[tag=!terf_allsystemsworking] terf_data_E matches 97.. run function terf:entity/machines/opencore/broadcast {level:0,text:'{"text":"System Check Complete! ","color":"aqua"},{"text":"Maintenance Required.","color":"gold"}'}
execute if score @s terf_data_E matches 97.. run scoreboard players set @s datapipes_lib_power_max 1000
