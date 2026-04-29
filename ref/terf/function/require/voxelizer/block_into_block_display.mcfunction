#the arguments of this function need x2,y2,z2 terf_states multiplied by 2 and terf:temp temp to be the pivot point
execute if block ~ ~ ~ #minecraft:air run return fail
loot replace entity 0010ccd2-0010-cd37-0010-cd360010c8e1 contents loot blockstate:get
execute align xyz run summon minecraft:block_display ~ ~ ~ {Tags:["terf_currententity"]}
execute as @e[type=minecraft:block_display,tag=terf_currententity,limit=1] run function terf:require/voxelizer/lib/as_block_display
