loot replace entity 0010ccd2-0010-cd37-0010-cd360010c8e1 contents loot blockstate:get
data modify storage terf:temp args set from entity @s data.terf
execute align xyz summon minecraft:block_display run function terf:entity/machines/stasis_laser/as_block_display with storage terf:temp args
setblock ~ ~ ~ air
