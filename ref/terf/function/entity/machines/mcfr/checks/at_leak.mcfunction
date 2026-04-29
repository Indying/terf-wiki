#if its too hot or has too much pressure, just skip all this and explode
execute if score core_temp_divided terf_states matches 1000.. at @s run return run function terf:entity/machines/mcfr/detonation/detonate_reactor
execute if score pressure terf_states matches 10000000.. at @s run return run function terf:entity/machines/mcfr/detonation/detonate_reactor

#immediately cool below operating temperatures
execute if score core_temp_divided terf_states matches 500.. run scoreboard players set @s terf_data_A 1000000
execute if score core_temp_divided terf_states matches 500.. run scoreboard players set core_temp_divided terf_states 100

#make the fuel, waste and steam leak out here, make it make a sound if there is a lot of it
function terf:entity/machines/mcfr/checks/leak_gas with entity @s data.fluids[2]
scoreboard players set fuel_amount terf_states 0

function terf:entity/machines/mcfr/checks/leak_gas with entity @s data.fluids[3]
scoreboard players set waste_amount terf_states 0

scoreboard players set steam_amount terf_states 0
