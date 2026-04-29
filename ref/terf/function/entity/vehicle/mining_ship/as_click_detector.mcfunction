execute on target run scoreboard players set right_click terf_states 1
execute on attacker run scoreboard players set left_click terf_states 1

execute unless data storage terf:temp temp2[0] on target as @s[nbt=!{SelectedItem:{id:"minecraft:iron_ingot"}}] run ride @s mount @n[type=minecraft:interaction,tag=terf_vehicle_seat]
execute if score damage terf_states matches 1.. unless data storage terf:temp temp2[0] on target as @s[nbt={SelectedItem:{id:"minecraft:iron_ingot"}}] run function terf:entity/vehicle/mining_ship/as_player_repairing

execute run data remove entity @s interaction
execute run data remove entity @s attack