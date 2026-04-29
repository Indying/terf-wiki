execute unless block ~ ~ ~ waxed_copper_bulb unless block ~ ~ ~ waxed_cut_copper run return fail
execute positioned ~ ~-1 ~ run function terf:entity/machines/redstone_probe/at_bulbs

data merge block ^ ^ ^1 {front_text:{has_glowing_text:1b,color:"white"}}
execute unless block ^ ^ ^1 acacia_wall_sign{front_text:{messages:["if"]}} run return fail

execute if block ~ ~ ~ waxed_copper_bulb[lit=true] run setblock ~ ~ ~ waxed_copper_bulb[lit=false]

scoreboard players set value terf_states -694206942
data modify storage terf:temp args set value {arg1:'scoreboard players operation value terf_states = ',arg4:' terf_states'}
data modify storage terf:temp args.arg2 set from block ^ ^ ^1 front_text.messages[1]
data modify storage terf:temp args.arg3 set from block ^ ^ ^1 front_text.messages[2]
function datapipes_lib:require/with_args/4 with storage terf:temp args

data modify storage terf:temp args.text set from block ^ ^ ^1 front_text.messages[3]
function terf:entity/machines/redstone_probe/secure_parse with storage terf:temp args
