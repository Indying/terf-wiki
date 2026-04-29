#placeholder slots
execute positioned ^1 ^ ^ unless data block ~ ~ ~ Items[{Slot:0b}] run item replace block ~ ~ ~ container.0 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
execute positioned ^1 ^ ^ unless data block ~ ~ ~ Items[{Slot:1b}] run item replace block ~ ~ ~ container.1 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
execute positioned ^1 ^ ^ unless data block ~ ~ ~ Items[{Slot:3b}] run item replace block ~ ~ ~ container.3 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
execute positioned ^1 ^ ^ unless data block ~ ~ ~ Items[{Slot:4b}] run item replace block ~ ~ ~ container.4 with carrot_on_a_stick[item_name="Slot Placeholder",item_model="terf:visual/slot_placeholder",minecraft:custom_data={id:terf_placeholder}]
data modify block ^1 ^ ^ CustomName set value {"text":"Fuel Loader"}

execute unless block ~ ~1 ~ #terf:fission_fuel_rod run return run function terf:entity/machines/fission_fuel_loader/reset

#execute if block ^-1 ^ ^-1 minecraft:waxed_copper_bulb[lit=true] run scoreboard players set mode terf_states 0


scoreboard players set mode terf_states 1
scoreboard players set terminated terf_states 0

execute align xyz positioned ~.5 ~.5 ~.5 run function terf:entity/machines/fission_fuel_loader/add_fuel_check
execute if score terminated terf_states matches 1 run return run function terf:entity/machines/fission_fuel_loader/reset
function terf:entity/machines/fission_fuel_loader/operation
