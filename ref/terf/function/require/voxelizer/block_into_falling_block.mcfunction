execute if block ~ ~ ~ air run return fail
execute if block ~ ~ ~ tnt run return fail
loot replace entity 0010ccd2-0010-cd37-0010-cd360010c8e1 contents loot blockstate:get
setblock ~ ~ ~ air
execute in terf:intermediary_technical_storage_dimension run summon minecraft:falling_block 29999999 1 29999999 {Tags:["terf_currententity"]}
execute as @e[type=minecraft:falling_block,tag=terf_currententity,limit=1] run function terf:require/voxelizer/lib/as_falling_block
