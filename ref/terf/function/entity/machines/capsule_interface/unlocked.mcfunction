tag @s remove terf_locked

#check if multiblock has fluids
execute unless data entity @s data.fluids run return fail

playsound terf:clack_out master @a[distance=0..] ~ ~ ~ 1 1
playsound terf:clack_in master @a[distance=0..] ~ ~ ~ 1 1
playsound terf:clack_out master @a[distance=0..] ~ ~ ~ 1 1.5
playsound terf:clack_in master @a[distance=0..] ~ ~ ~ 1 1.5

#load data from the multiblock
data modify storage terf:temp array set from entity @s data.fluids
data remove entity @s data.fluids

#explode if the structure is broken while you unlock antimatter
data modify storage terf:temp args.array set from storage terf:temp array
execute unless function terf:entity/machines/capsule_interface/structure_checks run execute if function terf:entity/explosion/antimatter/attempt_explosion run function terf:entity/machines/multiblock_core_kill

#remove unnesesary data
data remove storage terf:temp array[].outpos
data remove storage terf:temp array[].checks
data remove storage terf:temp array[].changetype
data remove storage terf:temp array[].pipe_on
data remove storage terf:temp array[].pipe_off

#save data to capsule
$data modify entity @n[type=item_display,tag=terf_related_$(machine_id),tag=terf_receptacle_0] item.components.minecraft:custom_data.fluids set from storage terf:temp array
$tag @e[type=interaction,tag=terf_related_$(machine_id),tag=terf_receptacle] remove terf_locked

#remove fluid filters
function terf:entity/machines/capsule_interface/remove_filters with storage terf:temp array[0]
tag @s remove datapipes_lib_fluid_generator
