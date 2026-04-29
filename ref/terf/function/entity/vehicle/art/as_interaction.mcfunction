execute if data entity @s attack run function terf:entity/vehicle/art/player_hit
data remove entity @s attack

scoreboard players set temp terf_states 0
execute on target run function terf:entity/vehicle/art/player_use
execute if score temp terf_states matches 1 run function terf:entity/vehicle/art/assembly/summon_stand
execute if score temp terf_states matches 2 on vehicle on passengers if entity @s[tag=terf_art_stand] on vehicle on passengers if entity @s[type=minecraft:interaction] run function terf:entity/vehicle/art/assembly/summon_gun
data remove entity @s interaction

#heal
execute if score ETratetimer terf_states matches 10.. if score @s terf_data_B matches 1.. run scoreboard players remove @s terf_data_B 1
