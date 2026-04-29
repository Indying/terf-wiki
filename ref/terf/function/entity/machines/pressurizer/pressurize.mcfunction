execute if function terf:require/is_dimension_not_space run return fail
data modify storage terf:temp args set value {command:'function terf:entity/machines/pressurizer/stand/summon with entity @s data.terf'}
execute store result storage terf:temp args.n int 1 run scoreboard players get pressurizer_particle_count terf_states
function terf:require/run_n_times with storage terf:temp args
scoreboard players set @s terf_data_A -1