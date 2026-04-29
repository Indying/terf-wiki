tp @s ^ ^ ^1
execute at @s unless entity @a[distance=..400] run function terf:entity/meteor/kill
execute at @s unless loaded ~ ~ ~ run function terf:entity/meteor/kill

function terf:entity/meteor/effects

#spin me right round
scoreboard players add @s terf_data_A 1
data modify storage terf:temp args set value {arg1:'data merge entity @s {start_interpolation:0,transformation:{left_rotation:{axis:[1.0f,0.0f,0.0f],angle:',arg3:'}}}'}
execute store result storage terf:temp args.arg2 float 0.2 run scoreboard players get @s terf_data_A
function datapipes_lib:require/with_args/3 with storage terf:temp args