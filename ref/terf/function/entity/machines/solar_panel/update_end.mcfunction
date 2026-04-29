#explode if the input is connected with the output
execute if block ^1 ^ ^ red_glazed_terracotta run tag @s add terf_kaput
execute positioned ^ ^1 ^ run function terf:entity/machines/solar_panel/wire_checks/pipes_off
execute if entity @s[tag=terf_kaput] positioned ^1 ^1 ^ run function terf:entity/machines/solar_panel/explode

execute unless score @s terf_data_C matches 0 run function datapipes_lib:require/contingency
