data modify storage terf:temp args set value {arg1:'summon minecraft:item_display ~ ~ ~ {brightness:{sky:15,block:15},Tags:["terf_orbital_strike_particle","terf_orbital_strike_flash","terf_related_',arg3:'"],item:{id:"minecraft:white_stained_glass"},interpolation_duration:10}'}
execute store result storage terf:temp args.arg2 int 1 run scoreboard players get @s terf_scorelink
function datapipes_lib:require/with_args/3 with storage terf:temp args
