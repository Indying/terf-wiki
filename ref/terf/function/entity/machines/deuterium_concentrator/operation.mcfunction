execute if score @s datapipes_lib_power_storage matches ..4 run return fail

scoreboard players remove @s datapipes_lib_power_storage 4
scoreboard players remove @s terf_data_A 1
execute if score @s terf_data_A matches 1.. run return fail

execute store result score heavy_water_amount terf_states run data get entity @s data.fluids[2].amount
execute store result score depleted_water_amount terf_states run data get entity @s data.fluids[1].amount

scoreboard players add heavy_water_amount terf_states 310
scoreboard players add depleted_water_amount terf_states 9690

execute if score heavy_water_amount terf_states matches 1001.. run scoreboard players set heavy_water_amount terf_states 1000
execute if score depleted_water_amount terf_states matches 10001.. run scoreboard players set depleted_water_amount terf_states 10000

execute store result entity @s data.fluids[2].amount int 1 run scoreboard players get heavy_water_amount terf_states
execute store result entity @s data.fluids[1].amount int 1 run scoreboard players get depleted_water_amount terf_states

function terf:entity/machines/deuterium_concentrator/checks
execute if score @s terf_data_A matches 0 run fill ^1 ^1 ^-1 ^-1 ^4 ^-1 waxed_oxidized_copper_bulb[lit=false] replace waxed_oxidized_copper_bulb[lit=true]