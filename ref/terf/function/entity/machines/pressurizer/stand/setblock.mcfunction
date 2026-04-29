execute store success score succeeded terf_states run setblock ~ ~ ~ void_air keep
execute if score succeeded terf_states matches 0 run return fail
setblock ~1 ~ ~ void_air keep
setblock ~-1 ~ ~ void_air keep
setblock ~ ~1 ~ void_air keep 
setblock ~ ~-1 ~ void_air keep
setblock ~ ~ ~1 void_air keep
setblock ~ ~ ~-1 void_air keep
particle poof ~ ~ ~ 0 0 0 0 1 force

function terf:entity/machines/pressurizer/stand/setblock_args with entity @s data.terf