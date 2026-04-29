execute store result score target_height terf_states run data get storage terf:temp args.array[0].pos[1] 2

data modify storage terf:temp args2.array set from entity @s data.terf.links.minecraft:dark_oak_button
execute if block ~ ~ ~ #terf:interactables[powered=true] run function terf:entity/machines/gear_elevator/button_checks/as_all_wood_buttons_topcheck