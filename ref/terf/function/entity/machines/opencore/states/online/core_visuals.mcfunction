scoreboard players operation temp terf_states = @s terf_data_E
scoreboard players operation temp terf_states %= 360 terf_states
data modify storage terf:temp args.command set from entity @s data.terf.stored_recipe.operations[0].core
function datapipes_lib:require/complex_function/1 with storage terf:temp args

execute store result storage terf:temp args2.spread float 0.025 run data get entity @s data.terf.opencore.height 10
data modify storage terf:temp args set value {command:"function terf:entity/machines/opencore/states/online/rotating_particles with storage terf:temp args2"}
execute store result storage terf:temp args.angle int 1 run scoreboard players get temp terf_states
function datapipes_lib:require/run_with_angle with storage terf:temp args

data modify storage terf:temp args set value {command:"function terf:entity/machines/opencore/states/online/counterrotating_particles"}
execute store result storage terf:temp args.angle int -2 run scoreboard players get temp terf_states
function datapipes_lib:require/run_with_angle with storage terf:temp args

particle minecraft:electric_spark ~.5 ~6 ~.5 0.2 2 0.2 0.5 10 force
