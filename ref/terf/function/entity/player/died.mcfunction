scoreboard players set @s terf_deaths 0
scoreboard players set @s terf_data_Q 0
scoreboard players set @s terf_data_R 0
tag @s remove terf_cant_breathe

#clear radiation
execute if score @s terf_data_I matches 5000001.. run scoreboard players set @s terf_data_I 5000000
scoreboard players set @s terf_data_N 0
#scoreboard players set @s terf_data_I 0
scoreboard players set @s terf_data_H 0

#terf map additions
function terf_oldmapadditions:player/died
