execute if score NETratetimer terf_states >= NETrate terf_states run function terf:entity/machines/block_placer/slower_tick
execute unless block ^ ^ ^1 #minecraft:replaceable run return fail
function terf:entity/machines/block_placer/place with block ~ ~ ~ Items[{Slot:4b}]