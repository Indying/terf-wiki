execute positioned ^ ^2 ^ unless data block ~ ~ ~ Items[{Slot:0b}] run item replace block ~ ~ ~ container.0 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
execute positioned ^ ^2 ^ unless data block ~ ~ ~ Items[{Slot:1b}] run item replace block ~ ~ ~ container.1 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
execute positioned ^ ^2 ^ unless data block ~ ~ ~ Items[{Slot:3b}] run item replace block ~ ~ ~ container.3 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
execute positioned ^ ^2 ^ unless data block ~ ~ ~ Items[{Slot:4b}] run item replace block ~ ~ ~ container.4 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
data modify block ^ ^2 ^ CustomName set value "Crusher: input"

#get recipe from storage
data modify storage terf:temp args2 set value {name:"crusher",a:"z"}
data modify storage terf:temp args2.a set from block ^ ^2 ^ Items[{Slot:2b}].id
data modify storage terf:temp args2.a set from block ^ ^2 ^ Items[{Slot:2b}].components.minecraft:custom_data.id

function terf:require/read_1_recipes with storage terf:temp args2
execute unless data storage terf:temp output.z run return fail

#start the machine
data modify entity @s data.terf.stored_recipe set from storage terf:temp output
item modify block ^ ^2 ^ container.2 datapipes_lib:decrement_item
execute store result score @s terf_data_A run data get storage terf:temp output.t