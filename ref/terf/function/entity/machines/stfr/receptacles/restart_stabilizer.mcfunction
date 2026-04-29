$execute if entity @n[type=marker,tag=terf_stfr,tag=terf_machineid_$(machine_id),tag=!terf_breakers_activated] run return fail
$tag @n[type=marker,tag=terf_stfr,tag=terf_machineid_$(machine_id)] remove terf_receptacles_locked
$execute as @n[type=marker,tag=terf_stfr,tag=terf_machineid_$(machine_id)] run function terf:entity/machines/stfr/receptacles/make_injection_list with entity @s data.terf

execute if data entity @s {data:{terf:{rid:1}}} positioned ~ ~9 ~ if block ~ ~ ~ minecraft:pink_glazed_terracotta run setblock ~ ~ ~ minecraft:redstone_block
execute if data entity @s {data:{terf:{rid:2}}} positioned ~ ~ ~9 if block ~ ~ ~ minecraft:pink_glazed_terracotta run setblock ~ ~ ~ minecraft:redstone_block
execute if data entity @s {data:{terf:{rid:3}}} positioned ~9 ~ ~ if block ~ ~ ~ minecraft:pink_glazed_terracotta run setblock ~ ~ ~ minecraft:redstone_block
execute if data entity @s {data:{terf:{rid:4}}} positioned ~ ~ ~-9 if block ~ ~ ~ minecraft:pink_glazed_terracotta run setblock ~ ~ ~ minecraft:redstone_block
execute if data entity @s {data:{terf:{rid:5}}} positioned ~-9 ~ ~ if block ~ ~ ~ minecraft:pink_glazed_terracotta run setblock ~ ~ ~ minecraft:redstone_block
execute if data entity @s {data:{terf:{rid:6}}} positioned ~ ~-9 ~ if block ~ ~ ~ minecraft:pink_glazed_terracotta run setblock ~ ~ ~ minecraft:redstone_block
