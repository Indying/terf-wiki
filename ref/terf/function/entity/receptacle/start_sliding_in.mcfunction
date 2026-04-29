#fail if capsule is already in
execute if score @s terf_data_A matches 1.. run return fail

#fail if player clicked with not a capsule
execute on target run item replace entity 0010ccd2-0010-cd37-0010-cd360010c8e1 container.0 from entity @s weapon
execute unless data entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_data.terf.capsule_contents run return fail

execute on target run item replace entity @s weapon with air
data modify storage terf:temp args set from entity @s
execute positioned ~ ~.5 ~ summon minecraft:item_display run function terf:entity/receptacle/as_summoned_capsule with storage terf:temp args.data.terf
scoreboard players add @s terf_data_A 1
scoreboard players set receptacle_tick terf_states 32
