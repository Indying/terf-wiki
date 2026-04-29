execute if block ~ ~ ~ #terf:unpushable run return fail
execute if block ~ ~ ~ #terf:air_and_water run return fail
scoreboard players add temp terf_states 1
execute if score temp terf_states > multi_piston_push_limit terf_states run return fail

execute if block ^ ^ ^1 honey_block run return fail
function terf:entity/machines/crane/move_block_back
execute if block ^ ^ ^-1 #terf:non_sticky run return fail

execute positioned ^ ^ ^1 run function terf:entity/machines/multi_piston/retract