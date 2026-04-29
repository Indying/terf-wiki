#placeholder slots
execute positioned ^1 ^3 ^ unless data block ~ ~ ~ Items[{Slot:0b}] run item replace block ~ ~ ~ container.0 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
execute positioned ^1 ^3 ^ unless data block ~ ~ ~ Items[{Slot:1b}] run item replace block ~ ~ ~ container.1 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
execute positioned ^1 ^3 ^ unless data block ~ ~ ~ Items[{Slot:3b}] run item replace block ~ ~ ~ container.3 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
execute positioned ^1 ^3 ^ unless data block ~ ~ ~ Items[{Slot:4b}] run item replace block ~ ~ ~ container.4 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]

execute positioned ^-1 ^3 ^ unless data block ~ ~ ~ Items[{Slot:0b}] run item replace block ~ ~ ~ container.0 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
execute positioned ^-1 ^3 ^ unless data block ~ ~ ~ Items[{Slot:1b}] run item replace block ~ ~ ~ container.1 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
execute positioned ^-1 ^3 ^ unless data block ~ ~ ~ Items[{Slot:3b}] run item replace block ~ ~ ~ container.3 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
execute positioned ^-1 ^3 ^ unless data block ~ ~ ~ Items[{Slot:4b}] run item replace block ~ ~ ~ container.4 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]

data modify block ^-1 ^3 ^ CustomName set value {"text":"Hadron Collider: Target"}
data modify block ^1 ^3 ^ CustomName set value {"text":"Hadron Collider: Material"}
#target aka material 1
#material aka material 2

#recipe checks
data modify storage terf:temp args2 set value {name:"hadron_collider",a:"z",b:"z"}

data modify storage terf:temp args2.a set from block ^-1 ^3 ^ Items[{Slot:2b}].id
data modify storage terf:temp args2.a set from block ^-1 ^3 ^ Items[{Slot:2b}].components.minecraft:custom_data.id
execute store result score aa terf_states run data get block ^-1 ^3 ^ Items[{Slot:2b}].count

data modify storage terf:temp args2.b set from block ^1 ^3 ^ Items[{Slot:2b}].id
data modify storage terf:temp args2.b set from block ^1 ^3 ^ Items[{Slot:2b}].components.minecraft:custom_data.id
execute store result score ba terf_states run data get block ^1 ^3 ^ Items[{Slot:2b}].count

scoreboard players set temp terf_states 0
function terf:require/read_2_recipes with storage terf:temp args2

execute store result score a terf_states run data get storage terf:temp output.a
execute store result score b terf_states run data get storage terf:temp output.b

scoreboard players operation a terf_states *= @s terf_data_D
scoreboard players operation b terf_states *= @s terf_data_D

execute if data storage terf:temp output.z if score @s datapipes_lib_power_storage matches 1.. if score aa terf_states >= a terf_states if score ba terf_states >= b terf_states run function terf:entity/machines/hadron_collider/activated
