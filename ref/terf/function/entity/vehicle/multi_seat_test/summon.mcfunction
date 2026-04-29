summon interaction ~ ~ ~ {Tags:["terf_seat","terf_test","terf_currententity"]}
summon interaction ~ ~ ~ {Tags:["terf_seat","terf_seat_1","terf_currententity"]}
summon interaction ~ ~ ~ {Tags:["terf_seat","terf_seat_2","terf_currententity"]}
summon interaction ~ ~ ~ {Tags:["terf_seat","terf_seat_3","terf_currententity"]}
summon interaction ~ ~ ~ {Tags:["terf_seat","terf_seat_4","terf_currententity"]}

scoreboard players operation @s terf_scorelink = currentcoreid terf_states
data modify storage terf:temp args set value {arg1:"tag @e[type=interaction,tag=terf_currententity,tag=!terf_test] add terf_related_"}
execute store result storage terf:temp args.arg2 double 1 run scoreboard players get @s terf_scorelink
function datapipes_lib:require/with_args/2 with storage terf:temp args

data modify entity @n[type=interaction,tag=terf_currententity,tag=terf_test] data.terf.machine_id set from storage terf:temp args.arg2

tag @e[type=interaction] remove terf_currententity