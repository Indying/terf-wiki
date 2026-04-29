execute if score @s datapipes_lib_power_storage matches ..4 run return fail

execute store result score heavy_water_amount terf_states run data get entity @s data.fluids[2].amount
execute if score heavy_water_amount terf_states matches 1000.. run return fail

execute store result score water_amount terf_states run data get entity @s data.fluids[0].amount
execute if score water_amount terf_states matches ..9999 run return fail

execute store result score depleted_water_amount terf_states run data get entity @s data.fluids[1].amount
execute if score depleted_water_amount terf_states matches 10000.. run return fail

execute unless function terf:entity/machines/deuterium_concentrator/structure_checks run return fail

#start the machine
scoreboard players set @s terf_data_A 70
data modify entity @s data.fluids[0].amount set value 0
fill ^1 ^1 ^-1 ^-1 ^4 ^-1 waxed_oxidized_copper_bulb[lit=true] replace waxed_oxidized_copper_bulb[lit=false]