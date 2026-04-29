
data modify storage terf:temp args set value {slot:2}
execute store result score temp terf_states run data get storage terf:temp output.a
scoreboard players operation temp terf_states *= @s terf_data_D
execute store result storage terf:temp args.amount int 1 run scoreboard players get temp terf_states
execute positioned ^-1 ^3 ^ run function datapipes_lib:require/remove_items with storage terf:temp args

data modify storage terf:temp args set value {slot:2}
execute store result score temp terf_states run data get storage terf:temp output.b
scoreboard players operation temp terf_states *= @s terf_data_D
execute store result storage terf:temp args.amount int 1 run scoreboard players get temp terf_states
execute positioned ^1 ^3 ^ run function datapipes_lib:require/remove_items with storage terf:temp args

execute store result score @s terf_data_A run data get storage terf:temp output.x

data modify entity @s data.terf.stored_recipe set from storage terf:temp output

execute unless score @s terf_data_B matches 0 run return fail
execute unless entity @s[tag=terf_hadronprimed] run return fail
playsound terf:charge_up.charge master @a[distance=0..] ~ ~ ~ 1 1.8
playsound terf:charge_up.charge master @a[distance=0..] ~ ~ ~ 1 1.8
playsound terf:charge_up.charge master @a[distance=0..] ~ ~ ~ 1 1.8
playsound terf:charge_up.charge master @a[distance=0..] ~ ~ ~ 1 1.8

#get first length
scoreboard players set length terf_states 0
setblock ^-2 ^1 ^ light[level=0] keep
scoreboard players set mode terf_states 1

tag @s add terf_currententity
execute positioned ^3 ^1 ^ rotated ~-90 ~ run function terf:entity/machines/hadron_collider/ring/raycast
tag @s remove terf_currententity

execute positioned ^-2 ^1 ^ if block ~ ~ ~ light[level=0] run setblock ~ ~ ~ air
scoreboard players operation @s terf_data_C = length terf_states

#calculate max power storage
scoreboard players operation @s datapipes_lib_power_max = length terf_states
scoreboard players operation @s datapipes_lib_power_max *= 1600 terf_states
