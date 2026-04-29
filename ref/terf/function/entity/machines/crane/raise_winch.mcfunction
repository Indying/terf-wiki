execute unless data block ~ ~ ~ Items[{Slot:0b}] run item replace block ~ ~ ~ container.0 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
execute unless data block ~ ~ ~ Items[{Slot:1b}] run item replace block ~ ~ ~ container.1 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
execute unless data block ~ ~ ~ Items[{Slot:3b}] run item replace block ~ ~ ~ container.3 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
execute unless data block ~ ~ ~ Items[{Slot:4b}] run item replace block ~ ~ ~ container.4 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
data modify block ~ ~ ~ CustomName set value "Winch"

scoreboard players set temp terf_states 0
scoreboard players set rod_activated terf_states 0
execute positioned ~ ~-1 ~ if block ~ ~ ~ iron_chain run function terf:entity/machines/crane/raise_winch/raise
playsound terf:spotlight2 master @a[distance=0..] ~ ~ ~ 1 0.9
execute if score temp terf_states matches 1 if block ~ ~ ~ minecraft:hopper{Items:[{Slot:2b,id:"minecraft:iron_chain"}]} run item modify block ~ ~ ~ container.2 datapipes_lib:increment_item
execute if score temp terf_states matches 1 unless data block ~ ~ ~ Items[{Slot:2b}] run item replace block ~ ~ ~ container.2 with minecraft:iron_chain

tag @s remove terf_currententity