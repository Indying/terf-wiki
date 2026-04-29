execute unless data block ~ ~ ~ Items[{Slot:0b}] run item replace block ~ ~ ~ container.0 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
execute unless data block ~ ~ ~ Items[{Slot:1b}] run item replace block ~ ~ ~ container.1 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
execute unless data block ~ ~ ~ Items[{Slot:3b}] run item replace block ~ ~ ~ container.3 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
execute unless data block ~ ~ ~ Items[{Slot:4b}] run item replace block ~ ~ ~ container.4 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
data modify block ~ ~ ~ CustomName set value "Winch"

scoreboard players set temp terf_states 0
execute if block ~ ~ ~ minecraft:hopper{Items:[{Slot:2b,id:"minecraft:iron_chain"}]} positioned ~ ~-1 ~ run function terf:entity/machines/crane/lower_winch/lower
execute if block ~ ~ ~ minecraft:hopper{Items:[{Slot:2b,id:"minecraft:iron_chain"}]} run playsound terf:spotlight2 master @a[distance=0..] ~ ~ ~ 1 0.8
execute if score temp terf_states matches 1 run item modify block ~ ~ ~ container.2 datapipes_lib:decrement_item

tag @s remove terf_currententity
