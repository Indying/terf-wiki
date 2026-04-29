tag @s add terf_locked

#check structure
execute unless function terf:entity/machines/capsule_interface/structure_checks run return fail

#check if capsule is open and has fluids
scoreboard players set succeeded terf_states 0
$execute if data entity @n[type=item_display,tag=terf_related_$(machine_id),tag=terf_receptacle_0] item.components.minecraft:custom_data.fluids run scoreboard players set succeeded terf_states 1
execute if score succeeded terf_states matches 0 run return fail

playsound terf:gas_valve master @a[distance=0..] ~ ~ ~ 0.7 2

#load data from capsule
$data modify storage terf:temp array set from entity @n[type=item_display,tag=terf_related_$(machine_id),tag=terf_receptacle_0] item.components.minecraft:custom_data.fluids
$data modify entity @n[type=item_display,tag=terf_related_$(machine_id),tag=terf_receptacle_0] item.components.minecraft:custom_data.fluids[].id set value "empty"
$data modify entity @n[type=item_display,tag=terf_related_$(machine_id),tag=terf_receptacle_0] item.components.minecraft:custom_data.fluids[].amount set value 0
$tag @e[type=interaction,tag=terf_related_$(machine_id),tag=terf_receptacle] add terf_locked

#add additional data to all array entries
data modify storage terf:temp array[].outpos set value "^ ^1 ^-2"
data modify storage terf:temp array[].checks set value "if function terf:entity/machines/capsule_interface/checks"
data modify storage terf:temp array[].changetype set value ""

#add additional data if its an output
execute if block ^ ^1 ^-1 waxed_lightning_rod[facing=down] run data modify storage terf:temp array[].pipe_on set value "function datapipes_lib:require/pipe_presets/lightning_rod/pipes_on"
execute if block ^ ^1 ^-1 waxed_lightning_rod[facing=down] run data modify storage terf:temp array[].pipe_off set value "function datapipes_lib:require/pipe_presets/lightning_rod/pipes_off"
execute if block ^ ^1 ^-1 waxed_lightning_rod[facing=down] run tag @s add datapipes_lib_fluid_generator 

#TO-DO TODO

#save data to multiblock
data modify entity @s data.fluids set from storage terf:temp array

#add fluid filters
function terf:entity/machines/capsule_interface/add_filters with storage terf:temp array[0]