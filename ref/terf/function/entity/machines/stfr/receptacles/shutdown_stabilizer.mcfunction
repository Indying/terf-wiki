$execute if entity @n[type=marker,tag=terf_stfr,tag=terf_machineid_$(machine_id),scores={terf_data_Ae=21..}] on target run return run damage @s 5 terf:high_voltage

#fail if shutting down
$execute if score @n[type=marker,tag=terf_stfr,tag=terf_machineid_$(machine_id)] terf_data_A matches 4 run return fail

#tell the reactoring monitoring system:tm: that the capsule no longer contains deuterium
$execute as @n[type=item_display,tag=terf_related_$(machine_id),tag=terf_receptacle_$(rid)] run function terf:entity/machines/stfr/receptacles/remove_contains_tag

execute at @s positioned ^ ^.1 ^-.7 run function datapipes_lib:require/lightning_rod_off

execute if data entity @s {data:{terf:{rid:1}}} positioned ~ ~9 ~ if block ~ ~ ~ minecraft:redstone_block run setblock ~ ~ ~ minecraft:pink_glazed_terracotta
execute if data entity @s {data:{terf:{rid:2}}} positioned ~ ~ ~9 if block ~ ~ ~ minecraft:redstone_block run setblock ~ ~ ~ minecraft:pink_glazed_terracotta
execute if data entity @s {data:{terf:{rid:3}}} positioned ~9 ~ ~ if block ~ ~ ~ minecraft:redstone_block run setblock ~ ~ ~ minecraft:pink_glazed_terracotta
execute if data entity @s {data:{terf:{rid:4}}} positioned ~ ~ ~-9 if block ~ ~ ~ minecraft:redstone_block run setblock ~ ~ ~ minecraft:pink_glazed_terracotta
execute if data entity @s {data:{terf:{rid:5}}} positioned ~-9 ~ ~ if block ~ ~ ~ minecraft:redstone_block run setblock ~ ~ ~ minecraft:pink_glazed_terracotta
execute if data entity @s {data:{terf:{rid:6}}} positioned ~ ~-9 ~ if block ~ ~ ~ minecraft:redstone_block run setblock ~ ~ ~ minecraft:pink_glazed_terracotta

$execute if data entity @s {data:{terf:{rid:1}}} as @n[type=marker,tag=terf_stfr,tag=terf_machineid_$(machine_id)] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_stab1_breach",voiceline:'stfr.bct.stab1_shutdown',level:1,text:'{"text":"Fusion Reactor Stabilizer U Has Been Shut Down For Refueling!","color":"yellow"}'}
$execute if data entity @s {data:{terf:{rid:2}}} as @n[type=marker,tag=terf_stfr,tag=terf_machineid_$(machine_id)] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_stab2_breach",voiceline:'stfr.bct.stab2_shutdown',level:1,text:'{"text":"Fusion Reactor Stabilizer S Has Been Shut Down For Refueling!","color":"yellow"}'}
$execute if data entity @s {data:{terf:{rid:3}}} as @n[type=marker,tag=terf_stfr,tag=terf_machineid_$(machine_id)] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_stab3_breach",voiceline:'stfr.bct.stab3_shutdown',level:1,text:'{"text":"Fusion Reactor Stabilizer E Has Been Shut Down For Refueling!","color":"yellow"}'}
$execute if data entity @s {data:{terf:{rid:4}}} as @n[type=marker,tag=terf_stfr,tag=terf_machineid_$(machine_id)] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_stab4_breach",voiceline:'stfr.bct.stab4_shutdown',level:1,text:'{"text":"Fusion Reactor Stabilizer N Has Been Shut Down For Refueling!","color":"yellow"}'}
$execute if data entity @s {data:{terf:{rid:5}}} as @n[type=marker,tag=terf_stfr,tag=terf_machineid_$(machine_id)] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_stab5_breach",voiceline:'stfr.bct.stab5_shutdown',level:1,text:'{"text":"Fusion Reactor Stabilizer W Has Been Shut Down For Refueling!","color":"yellow"}'}
$execute if data entity @s {data:{terf:{rid:6}}} as @n[type=marker,tag=terf_stfr,tag=terf_machineid_$(machine_id)] run function terf:entity/machines/stfr/broadcast {bcd:"tag @s add terf_stab6_breach",voiceline:'stfr.bct.stab6_shutdown',level:1,text:'{"text":"Fusion Reactor Stabilizer D Has Been Shut Down For Refueling!","color":"yellow"}'}
tag @s add terf_stab_pistons_breach