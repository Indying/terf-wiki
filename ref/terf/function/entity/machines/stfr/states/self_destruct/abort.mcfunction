execute if score @s terf_data_E matches 2096.. run return fail

function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:2,text:'{"text":"The Fusion Reactor Self-Destruct Protocol Has Been Aborted By Facility Administration.","color":"red"}'}

scoreboard players set @s terf_data_A 3
execute if entity @s[tag=terf_stfr_offline] run scoreboard players set @s terf_data_A 0
tag @s remove terf_stfr_offline

scoreboard players set @s terf_data_E 0
stopsound @a[distance=..512] * terf:music.the_final_flash_of_existance_remix
