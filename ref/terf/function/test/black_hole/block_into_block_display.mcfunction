#the arguments of this function need x2,y2,z2 terf_states multiplied by 2 and terf:temp temp to be the pivot point
loot replace entity 0010ccd2-0010-cd37-0010-cd360010c8e1 contents loot blockstate:get
execute align xyz summon block_display run function terf:test/black_hole/as_block_display
setblock ~ ~ ~ air