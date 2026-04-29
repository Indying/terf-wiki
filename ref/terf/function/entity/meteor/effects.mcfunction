execute if block ~ ~ ~ water run setblock ~ ~ ~ air
execute if block ~ ~ ~ lava run setblock ~ ~ ~ air
execute unless block ~ ~ ~ air unless block ~ ~ ~ barrier if entity @s[tag=!terf_exploded] positioned ^ ^ ^-1 run function terf:entity/meteor/explode

execute unless function terf:require/is_dimension_not_space run return fail
particle minecraft:explosion ^ ^ ^ 0 0 0 0 1 force @a
particle flash{color:[1,1,1,1]} ^ ^ ^ 0 0 0 0 1 force @a
particle minecraft:campfire_signal_smoke ^ ^ ^ 0 0 0 0 1 force @a
particle minecraft:flame ^ ^ ^ 0 0 0 0.2 5 force @a