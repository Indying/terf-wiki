execute unless score @s terf_data_A matches 1.. run data modify entity @s data.terf.fission_fuel_loader.loading_type set from block ^1 ^ ^ Items[2].components.minecraft:custom_data.fission_fuel.type

scoreboard players operation temp terf_states = @s terf_data_A
scoreboard players add temp terf_states 100
data modify storage terf:temp args set value {arg1:'particle minecraft:electric_spark ~ ~',arg3:' ~ 0.2 0 0.2 0 10 force'}
execute store result storage terf:temp args.arg2 float 0.005 run scoreboard players get temp terf_states
execute align xyz positioned ~.5 ~.5 ~.5 run function terf:entity/machines/fission_fuel_loader/particle_on_top

data modify storage terf:temp temp set from entity @s data.terf.fission_fuel_loader.loading_type
execute store success score temp2 terf_states run data modify storage terf:temp temp set from block ^1 ^ ^ Items[{Slot:2b}].components.minecraft:custom_data.fission_fuel.type
execute unless data block ^1 ^ ^ Items[{Slot:2b}].components.minecraft:custom_data.fission_fuel run scoreboard players set temp2 terf_states 1
execute if score temp2 terf_states matches 1 run return fail

scoreboard players add @s terf_data_A 1

scoreboard players operation temp terf_states = @s terf_data_A
scoreboard players operation temp terf_states %= 20 terf_states
execute if score temp terf_states matches 0 run playsound terf:fuel_pellet_loading master @a[distance=0..] ~ ~ ~ 1 1
execute if score temp terf_states matches 0 run item modify block ^1 ^ ^ container.2 datapipes_lib:decrement_item

execute if score @s terf_data_A matches 200.. run function terf:entity/machines/fission_fuel_loader/complete