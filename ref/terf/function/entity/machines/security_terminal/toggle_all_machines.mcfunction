$scoreboard players operation temp terf_states = @n[type=marker,tag=terf_machineid_$(machine_id)] terf_connected_mainframe

scoreboard players set temp2 terf_states 0
$execute as @e[type=minecraft:marker,tag=terf_linked_to_$(machine_id)] if score @s terf_connected_mainframe = temp terf_states run function terf:entity/machines/security_terminal/as_toggled_machine
$scoreboard players operation @n[type=marker,tag=terf_machineid_$(machine_id)] terf_data_B = temp2 terf_states

playsound terf:alarms.toolbeep master @a[distance=0..] ~ ~ ~ 1 1
playsound terf:alarms.toolbeep master @a[distance=0..] ~ ~ ~ 1 1.03
