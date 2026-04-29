execute unless score @s terf_data_G matches 1.. run return fail
execute if entity @s[tag=!terf_holding_tau_cannon] positioned ^-.2 ^-.15 ^.3 run function terf:entity/player/tool/tau_cannon/shoot
tag @s remove terf_holding_tau_cannon

#particles
data modify storage terf:temp args set value {arg1:'particle minecraft:electric_spark ^-.2 ^-.15 ^.3 0 0 0 0',arg3:' 1 force @s'}
execute store result storage terf:temp args.arg2 float 0.0001 run scoreboard players get @s terf_data_G
function datapipes_lib:require/with_args/3 with storage terf:temp args

execute if score @s terf_data_G matches 100.. run particle dust{scale:0.3,color:[1.0,0.5,0.0]} ^-.2 ^-.15 ^.3 0 0 0 0 1 force @s
