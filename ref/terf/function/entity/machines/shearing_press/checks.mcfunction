#placeholder slots
execute positioned ^1 ^1 ^-1 unless data block ~ ~ ~ Items[{Slot:0b}] run item replace block ~ ~ ~ container.0 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
execute positioned ^1 ^1 ^-1 unless data block ~ ~ ~ Items[{Slot:1b}] run item replace block ~ ~ ~ container.1 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
execute positioned ^1 ^1 ^-1 unless data block ~ ~ ~ Items[{Slot:2b}] run item replace block ~ ~ ~ container.2 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
execute positioned ^1 ^1 ^-1 unless data block ~ ~ ~ Items[{Slot:3b}] run item replace block ~ ~ ~ container.3 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
execute positioned ^1 ^1 ^-1 unless data block ~ ~ ~ Items[{Slot:5b}] run item replace block ~ ~ ~ container.5 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
execute positioned ^1 ^1 ^-1 unless data block ~ ~ ~ Items[{Slot:6b}] run item replace block ~ ~ ~ container.6 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
execute positioned ^1 ^1 ^-1 unless data block ~ ~ ~ Items[{Slot:7b}] run item replace block ~ ~ ~ container.7 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
execute positioned ^1 ^1 ^-1 unless data block ~ ~ ~ Items[{Slot:8b}] run item replace block ~ ~ ~ container.8 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]

data modify block ^1 ^1 ^-1 CustomName set value "Shearing Press: Input"
data modify block ^1 ^ ^ CustomName set value "Shearing Press: Output"

#recipe checks
data modify storage terf:temp args set value {name:"shearing_press",a:"z"}

data modify storage terf:temp args.a set from block ^1 ^1 ^-1 Items[{Slot:4b}].id
data modify storage terf:temp args.a set from block ^1 ^1 ^-1 Items[{Slot:4b}].components.minecraft:custom_data.id

function terf:require/read_1_recipes with storage terf:temp args
execute if data storage terf:temp output.z if block ~ ~ ~ granite_stairs[half=top] if block ^ ^1 ^ granite_stairs[half=bottom] if block ^ ^ ^-1 granite_slab[type=double] if block ^ ^1 ^-1 granite_stairs[half=bottom] if block ^1 ^1 ^-1 dropper if block ^1 ^ ^-1 piston if block ^1 ^ ^ hopper run function terf:entity/machines/shearing_press/activated
