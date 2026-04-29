#get players held item into the item display
item replace entity 0010ccd2-0010-cd37-0010-cd360010c8e1 container.0 from entity @s weapon

#floats[0] = electromagnetic container state, 0=closed, 1=one hinge open, 2=two hinges open, 3=three hinges open, 4=four hinges open, 5=open
execute store result score temp terf_states run data get entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_model_data.floats[0]

execute if score temp terf_states matches 4 unless predicate datapipes_lib:pressing_sneak run function terf:require/play_with_random_pitch {s:'terf:clack_out master @a[distance=0..] ~ ~ ~ 1',min:6000,max:7500}
execute if score temp terf_states matches 5 if predicate datapipes_lib:pressing_sneak run function terf:require/play_with_random_pitch {s:'terf:clack_in master @a[distance=0..] ~ ~ ~ 1',min:6000,max:7500}

execute if score temp terf_states matches ..3 unless predicate datapipes_lib:pressing_sneak run function terf:require/play_with_random_pitch {s:'terf:clack_in master @a[distance=0..] ~ ~ ~ 1',min:9500,max:10500}
execute if score temp terf_states matches 1..4 if predicate datapipes_lib:pressing_sneak run function terf:require/play_with_random_pitch {s:'terf:clack_out master @a[distance=0..] ~ ~ ~ 1',min:9500,max:10500}

execute if score temp terf_states matches ..4 unless predicate datapipes_lib:pressing_sneak run scoreboard players add temp terf_states 1
execute if score temp terf_states matches 1.. if predicate datapipes_lib:pressing_sneak run scoreboard players remove temp terf_states 1

execute if score temp terf_states matches 4 run data modify entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_data.terf.capsule_contents set from entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_data.fluids
execute if score temp terf_states matches 4 run data remove entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_data.fluids

execute if score temp terf_states matches 5 run data modify entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_data.fluids set from entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_data.terf.capsule_contents
execute if score temp terf_states matches 5 run data remove entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_data.terf.capsule_contents

execute store result entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_model_data.floats[0] int 1 run scoreboard players get temp terf_states

#explode when opened with antimatter
execute as 0010ccd2-0010-cd37-0010-cd360010c8e1 run function terf:entity/player/tool/capsule/attempt_explosion with entity @s item.components.minecraft:custom_data.fluids[0]

#set item displays item into the players held item
item replace entity @s weapon from entity 0010ccd2-0010-cd37-0010-cd360010c8e1 container.0
