scoreboard players operation temp terf_states = @s terf_data_D
function terf:entity/machines/hadron_collider/run_results with entity @s data.terf.stored_recipe

execute positioned ^ ^-1 ^ run function terf:entity/machines/hadron_collider/slower_tick
scoreboard players set @s terf_data_B 0