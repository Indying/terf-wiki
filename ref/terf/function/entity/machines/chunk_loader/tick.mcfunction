execute if block ~ ~ ~ respawn_anchor[charges=0] run return run forceload remove ~-48 ~-48 ~48 ~48
execute if score @s terf_data_A matches 1.. run return run function terf:entity/machines/chunk_loader/use_charge

playsound minecraft:block.enchantment_table.use master @a[distance=0..] ~ ~ ~ 1 2
playsound minecraft:block.enchantment_table.use master @a[distance=0..] ~ ~ ~ 1 1.9
playsound minecraft:block.enchantment_table.use master @a[distance=0..] ~ ~ ~ 1 1.8
playsound minecraft:block.enchantment_table.use master @a[distance=0..] ~ ~ ~ 1 1.7
playsound minecraft:block.enchantment_table.use master @a[distance=0..] ~ ~ ~ 1 1.6
playsound minecraft:block.enchantment_table.use master @a[distance=0..] ~ ~ ~ 1 1.5
playsound minecraft:block.enchantment_table.use master @a[distance=0..] ~ ~ ~ 1 1.4
playsound minecraft:block.enchantment_table.use master @a[distance=0..] ~ ~ ~ 1 1.3
playsound minecraft:block.enchantment_table.use master @a[distance=0..] ~ ~ ~ 1 1.2
playsound minecraft:block.enchantment_table.use master @a[distance=0..] ~ ~ ~ 1 1.1
playsound minecraft:block.enchantment_table.use master @a[distance=0..] ~ ~ ~ 1 1
playsound minecraft:block.enchantment_table.use master @a[distance=0..] ~ ~ ~ 1 0.9
playsound minecraft:block.enchantment_table.use master @a[distance=0..] ~ ~ ~ 1 0.8
playsound minecraft:block.enchantment_table.use master @a[distance=0..] ~ ~ ~ 1 0.7
playsound minecraft:block.enchantment_table.use master @a[distance=0..] ~ ~ ~ 1 0.6
playsound minecraft:block.enchantment_table.use master @a[distance=0..] ~ ~ ~ 1 0.5

function datapipes_lib:require/run_in_all_directions {command:'particle reverse_portal ~ ~.5 ~ ^ ^ ^100000000 0.00000001 0 force',accuracy:1000}
scoreboard players add @s terf_data_A 144000
execute if block ~ ~ ~ respawn_anchor[charges=1] run return run setblock ~ ~ ~ respawn_anchor[charges=0]
execute if block ~ ~ ~ respawn_anchor[charges=2] run return run setblock ~ ~ ~ respawn_anchor[charges=1]
execute if block ~ ~ ~ respawn_anchor[charges=3] run return run setblock ~ ~ ~ respawn_anchor[charges=2]
execute if block ~ ~ ~ respawn_anchor[charges=4] run setblock ~ ~ ~ respawn_anchor[charges=3]
