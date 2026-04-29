execute if block ~ ~ ~ air run return fail
loot replace entity 0010ccd2-0010-cd37-0010-cd360010c8e1 contents loot blockstate:get
setblock ~ ~ ~ air
execute align xyz run summon minecraft:block_display ~ ~ ~ {Tags:["terf_currententity","terf_voxelizer_untagged"]}
execute as @e[type=minecraft:block_display,tag=terf_currententity,limit=1] run function terf:require/voxelizer/lib/as_block_display with storage terf:temp temp
