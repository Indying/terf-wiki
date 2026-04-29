scoreboard players set terminated terf_states 0
scoreboard players set mode terf_states 0
execute align xyz positioned ~.5 ~-.5 ~.5 run function terf:entity/machines/fission_fuel_loader/add_fuel_check

execute if score terminated terf_states matches 0 align xyz run summon minecraft:marker ~.5 ~.5 ~.5 {Tags:["terf_fuel_rod","terf_radioactive","terf_currententity"],data:{terf:{fission_fuel:{}}}}
execute if score terminated terf_states matches 0 run data modify entity @n[tag=terf_fuel_rod,tag=terf_currententity] data.terf.fission_fuel set from storage terf:temp temp
execute if score terminated terf_states matches 0 run tag @n[tag=terf_fuel_rod,tag=terf_currententity] remove terf_currententity