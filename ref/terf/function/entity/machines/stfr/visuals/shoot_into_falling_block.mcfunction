loot replace entity 0010ccd2-0010-cd37-0010-cd360010c8e1 contents loot blockstate:get
setblock ~ ~ ~ air
execute facing entity @n[type=marker,tag=terf_stfr] feet in terf:intermediary_technical_storage_dimension positioned 0. 0. 0. run tp 0010eff0-0010-effa-0010-cd370010c94e ^ ^ ^-1
execute in terf:intermediary_technical_storage_dimension run summon minecraft:falling_block 29999999 1 29999999 {Tags:["terf_currententity"]}
execute as @e[type=falling_block,tag=terf_currententity] run function terf:entity/machines/stfr/visuals/shoot_falling_block_as
