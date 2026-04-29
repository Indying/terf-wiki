execute if score @s terf_data_A matches 35 run function terf:require/run_n_times {n:10,command:'playsound terf:charge_up.mega_chargeup3 master @a[distance=0..] ~ ~ ~ 8 1'}
execute if score @s terf_data_A matches ..70 run particle minecraft:ominous_spawning ~ ~ ~ 0 0 0 5 100 force
execute if score @s terf_data_A matches 1000.. run return run function terf:entity/machines/stasis_laser/stop with entity @s data.terf

execute if score temp terf_states matches 0 positioned ^-1 ^ ^ run function datapipes_lib:require/lightning_rod_on
execute if score temp terf_states matches 2 positioned ^-1 ^ ^ run function datapipes_lib:require/lightning_rod_off

execute if score temp terf_states matches 2 positioned ^ ^-1 ^ run function datapipes_lib:require/lightning_rod_on
execute if score temp terf_states matches 4 positioned ^ ^-1 ^ run function datapipes_lib:require/lightning_rod_off

execute if score temp terf_states matches 4 positioned ^ ^ ^-1 run function datapipes_lib:require/lightning_rod_on
execute if score temp terf_states matches 6 positioned ^ ^ ^-1 run function datapipes_lib:require/lightning_rod_off

execute if score temp terf_states matches 6 positioned ^ ^1 ^ run function datapipes_lib:require/lightning_rod_on
execute if score temp terf_states matches 0 positioned ^ ^1 ^ run function datapipes_lib:require/lightning_rod_off

execute if score @s terf_data_A matches ..99 run return fail
playsound minecraft:block.beacon.power_select master @a[distance=0..] ~ ~ ~ 8 2
