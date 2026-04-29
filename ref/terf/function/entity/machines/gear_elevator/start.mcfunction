playsound terf:elevator_start master @a[distance=0..] ~ ~ ~ 2 1
tag @s add terf_elevator_running

#close doors
data modify storage terf:temp args.array set from entity @s data.terf.links.minecraft:lever
scoreboard players set temp terf_states 0
function terf:entity/machines/gear_elevator/doors/as_all_levers_array
