stopsound @a[distance=..32] * terf:elevator_start
playsound terf:elevator_stop master @a[distance=0..] ~ ~ ~ 2 1
tag @s remove terf_elevator_running

#open doors
data modify storage terf:temp args.array set from entity @s data.terf.links.minecraft:lever
scoreboard players set temp terf_states 1
function terf:entity/machines/gear_elevator/doors/as_all_levers_array
