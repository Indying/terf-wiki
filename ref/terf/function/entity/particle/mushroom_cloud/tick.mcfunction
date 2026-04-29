scoreboard players add @s terf_data_A 1
execute if score @s terf_data_A matches 80.. run return run kill @s

#calculate blackbody color
data modify storage terf:temp args set value {arg1:'data modify entity @s text.color set from storage terf:constants blackbody_hex.'}
execute store result storage terf:temp args.arg2 int 4 run scoreboard players get @s terf_data_A
function datapipes_lib:require/with_args/2 with storage terf:temp args

execute at @s run tp @s ^ ^ ^1

execute if score @s terf_data_A matches ..39 at @s run return run rotate @s ~ ~.3
execute if score @s terf_data_A matches 40..57 at @s run return run rotate @s ~ ~10
execute if score @s terf_data_A matches 58.. at @s run rotate @s ~ ~-10
execute if score @s terf_data_A matches 58 at @s run rotate @s ~180 ~
