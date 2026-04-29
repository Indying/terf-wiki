execute unless block ~ ~ ~ #terf:laser_can_go_through run return run kill @s
execute unless loaded ~ ~ ~ run return run kill @s

function terf:entity/particle/spark/move with entity @s
execute at @s run tp @s ~ ~-.1 ~

execute store result score speed terf_states run data get entity @s height 10
execute if score speed terf_states matches 1.. store result entity @s height float 0.009 run data get entity @s height 100
execute if score speed terf_states matches 2.. run return run data modify entity @s transformation.scale[2] set from entity @s height
execute if predicate datapipes_lib:chances/0.3 run return run kill @s
