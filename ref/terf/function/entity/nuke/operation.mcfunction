execute unless score @s terf_data_B = @s terf_data_B run scoreboard players operation @s terf_data_B = @s terf_data_A

scoreboard players remove @s terf_data_B 1
scoreboard players operation temp terf_states = @s terf_data_B 
execute if score @s terf_data_B matches 301.. run scoreboard players operation temp terf_states %= 20 terf_states
execute if score @s terf_data_B matches 201..300 run scoreboard players operation temp terf_states %= 10 terf_states
execute if score @s terf_data_B matches ..200 run scoreboard players operation temp terf_states %= 5 terf_states
execute if score @s terf_data_B matches ..100 run scoreboard players operation temp terf_states %= 3 terf_states
execute if score @s terf_data_B matches ..40 run scoreboard players set temp terf_states 0

execute if score @s terf_data_B matches 301.. if score temp terf_states matches 0 run playsound terf:alarms.toolbeep master @a[distance=0..] ~ ~ ~ 1 1.3
execute if score @s terf_data_B matches ..300 if score temp terf_states matches 0 run playsound terf:alarms.toolbeep master @a[distance=0..] ~ ~ ~ 10 1.3

execute unless score @s terf_data_B matches ..0 run return fail
execute on passengers run kill @s
kill @s
function terf:entity/explosion/nuclear/summon
