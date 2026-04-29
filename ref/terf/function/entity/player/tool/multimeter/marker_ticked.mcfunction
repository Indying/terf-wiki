scoreboard players operation calc terf_states = @s datapipes_lib_power_storage
scoreboard players operation calc2 terf_states = @s datapipes_lib_power_storage
scoreboard players operation calc2 terf_states /= NETrate terf_states
execute as @a[distance=..6] if items entity @s weapon.* *[custom_data~{id:"terf:multimeter"}] run tellraw @s ["",{"text":"[Multimeter]","color":"green"},{"text":" Received power: ","color":"yellow"},{"score":{"name":"calc","objective":"terf_states"},"color":"gold"},{"text":"MWt | ","color":"yellow"},{"score":{"name":"calc2","objective":"terf_states"},"color":"gold"},{"text":"MW","color":"yellow"}]
kill @s