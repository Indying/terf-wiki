execute unless block ~ ~1 ~ #minecraft:air run return fail
execute if block ~ ~ ~ #terf:indestructible run return fail
execute if block ~ ~ ~ #minecraft:air run return fail

loot replace entity 0010ccd2-0010-cd37-0010-cd360010c8e1 contents loot blockstate:get
setblock ~ ~ ~ air
execute align xyz run summon minecraft:block_display ~ ~ ~ {Tags:["terf_ascension"],teleport_duration:100}
data modify entity @n[type=block_display,tag=terf_ascension] block_state set from entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components."minecraft:custom_data"
