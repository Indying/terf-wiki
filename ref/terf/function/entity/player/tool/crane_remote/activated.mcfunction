data modify storage terf:temp temp set from entity @s SelectedItem.components.minecraft:custom_data

data modify storage terf:temp args set value {arg1:'execute as @e[tag=terf_machineid_',arg3:',distance=..1000] run tag @s add terf_currententity'}
execute store result storage terf:temp args.arg2 int 1 run data get storage terf:temp temp.terf.linked_machine
function datapipes_lib:require/with_args/3 with storage terf:temp args

execute if data storage terf:temp temp.terf.linked_machine unless entity @e[tag=terf_currententity] run function terf:entity/player/tool/crane_remote/unlink

scoreboard players set raytermination terf_states 0
execute unless entity @e[type=minecraft:marker,tag=terf_currententity] run return run function terf:entity/player/tool/crane_remote/raycast

execute if entity @s[x_rotation=70..90] if predicate datapipes_lib:pressing_sneak run return run execute as @e[type=minecraft:marker,tag=terf_crane,tag=terf_currententity] at @s run function terf:entity/machines/crane/raise_winch

scoreboard players set terminated terf_states 0
execute if entity @s[x_rotation=70..90] run return run execute as @e[type=minecraft:marker,tag=terf_crane,tag=terf_currententity] at @s run function terf:entity/machines/crane/lower_winch
execute if entity @s[x_rotation=-90..-45] run return run execute as @e[type=minecraft:marker,tag=terf_crane,tag=terf_currententity] at @s run function terf:entity/machines/crane/detach_winch

execute unless predicate datapipes_lib:pressing_sneak if entity @s[y_rotation=-45..45] as @e[type=minecraft:marker,tag=terf_crane,tag=terf_currententity] at @s rotated 0 0 run function terf:entity/machines/crane/move_crane
execute unless predicate datapipes_lib:pressing_sneak if entity @s[y_rotation=-135..-45] as @e[type=minecraft:marker,tag=terf_crane,tag=terf_currententity] at @s rotated -90 0 run function terf:entity/machines/crane/move_crane
execute unless predicate datapipes_lib:pressing_sneak if entity @s[y_rotation=135..-135] as @e[type=minecraft:marker,tag=terf_crane,tag=terf_currententity] at @s rotated 180 0 run function terf:entity/machines/crane/move_crane
execute unless predicate datapipes_lib:pressing_sneak if entity @s[y_rotation=45..135] as @e[type=minecraft:marker,tag=terf_crane,tag=terf_currententity] at @s rotated 90 0 run function terf:entity/machines/crane/move_crane

execute if predicate datapipes_lib:pressing_sneak if entity @s[y_rotation=-45..45] as @e[type=minecraft:marker,tag=terf_crane,tag=terf_currententity] at @s rotated 180 0 run function terf:entity/machines/crane/move_crane
execute if predicate datapipes_lib:pressing_sneak if entity @s[y_rotation=-135..-45] as @e[type=minecraft:marker,tag=terf_crane,tag=terf_currententity] at @s rotated 90 0 run function terf:entity/machines/crane/move_crane
execute if predicate datapipes_lib:pressing_sneak if entity @s[y_rotation=135..-135] as @e[type=minecraft:marker,tag=terf_crane,tag=terf_currententity] at @s rotated 0 0 run function terf:entity/machines/crane/move_crane
execute if predicate datapipes_lib:pressing_sneak if entity @s[y_rotation=45..135] as @e[type=minecraft:marker,tag=terf_crane,tag=terf_currententity] at @s rotated -90 0 run function terf:entity/machines/crane/move_crane

tag @e[type=minecraft:marker] remove terf_currententity