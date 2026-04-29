tag @s remove terf_rolling_mill_case
execute if block ^ ^2 ^1 minecraft:grindstone[face=ceiling] if block ^ ^1 ^1 minecraft:grindstone[face=floor] if block ^ ^2 ^-1 minecraft:grindstone[face=ceiling] if block ^ ^1 ^-1 minecraft:grindstone[face=floor] if block ^ ^1 ^ minecraft:grindstone[face=floor] if block ^ ^2 ^ minecraft:grindstone[face=ceiling] if block ^ ^3 ^2 minecraft:waxed_cut_copper_slab if block ^ ^2 ^2 minecraft:redstone_block if block ^1 ^2 ^2 minecraft:iron_trapdoor if block ^ ^2 ^3 minecraft:iron_trapdoor if block ^-1 ^2 ^2 minecraft:iron_trapdoor if block ^ ^2 ^-2 minecraft:hopper if block ^ ^1 ^-2 minecraft:granite_slab[type=double] if block ^ ^1 ^2 minecraft:cauldron if block ^ ^ ^2 minecraft:hopper if block ^ ^3 ^ minecraft:iron_trapdoor[half=bottom] if block ^ ^3 ^1 minecraft:iron_trapdoor[half=bottom] if block ^ ^ ^-2 minecraft:granite_stairs if block ^ ^3 ^-1 minecraft:iron_trapdoor[half=bottom] if block ^ ^ ^1 minecraft:brown_glazed_terracotta if block ^ ^ ^-1 minecraft:brown_glazed_terracotta run tag @s add terf_rolling_mill_case
execute unless entity @s[tag=terf_rolling_mill_case] run return fail

#placeholder slots
execute positioned ^ ^2 ^-2 unless data block ~ ~ ~ Items[{Slot:0b}] run item replace block ~ ~ ~ container.0 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
execute positioned ^ ^2 ^-2 unless data block ~ ~ ~ Items[{Slot:1b}] run item replace block ~ ~ ~ container.1 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
execute positioned ^ ^2 ^-2 unless data block ~ ~ ~ Items[{Slot:3b}] run item replace block ~ ~ ~ container.3 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
execute positioned ^ ^2 ^-2 unless data block ~ ~ ~ Items[{Slot:4b}] run item replace block ~ ~ ~ container.4 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]

data modify block ^ ^2 ^-2 CustomName set value "Rolling Mill: Input"
data modify block ^ ^ ^2 CustomName set value "Rolling Mill: Output"

#recipe checks
data modify storage terf:temp args2 set value {name:"rolling_mill",a:"z"}

data modify storage terf:temp args2.a set from block ^ ^2 ^-2 Items[{Slot:2b}].id
data modify storage terf:temp args2.a set from block ^ ^2 ^-2 Items[{Slot:2b}].components.minecraft:custom_data.id

scoreboard players set temp terf_states 0
function terf:require/read_1_recipes with storage terf:temp args2

execute if data storage terf:temp output.z run function terf:entity/machines/rolling_mill/activated
