scoreboard players set succeeded terf_states 0
execute on passengers if entity @s[type=player] run function terf:entity/vehicle/mrt/as_player
execute if score succeeded terf_states matches 0 run return fail

data modify storage terf:temp args.yaw set from storage terf:temp temp[0]
data modify storage terf:temp args.pitch set from storage terf:temp temp[1]
execute store result score temp terf_states run data get storage terf:temp args.pitch
execute if score temp terf_states matches 20.. run data modify storage terf:temp args.pitch set value 20f
execute on passengers if entity @s[type=interaction] on passengers run function terf:entity/vehicle/mrt/as_mount

scoreboard players set integrity terf_states 69
execute on passengers if entity @s[type=player] run title @s actionbar [{"text":"Ammo: "},{"score":{"objective":"terf_states","name":"ammo"}},{"text":" | Integrity: "},{"score":{"objective":"terf_states","name":"integrity"}},{"text":"%"}]