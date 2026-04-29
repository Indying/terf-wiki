scoreboard players operation temp terf_states = pressure terf_states
scoreboard players remove temp terf_states 10000000
scoreboard players operation temp terf_states /= 1000 terf_states

#sound and vent breaking
scoreboard players operation chance terf_states = temp terf_states
scoreboard players operation chance terf_states *= temp terf_states

execute store result storage terf:temp args.chance float 0.00000000111111111111 run scoreboard players get chance terf_states
execute store result storage terf:temp args.volume float 0.0004 run scoreboard players get temp terf_states

function terf:entity/machines/mcfr/visuals/overpressure_effects_args with storage terf:temp args

#==================== vent effects ====================
data modify storage terf:temp args set value {particle:"white_smoke"}
execute if score core_temp_divided terf_states matches 1000.. run data modify storage terf:temp args set value {particle:"smoke"}

execute store result storage terf:temp args.force int 20000 run scoreboard players get temp terf_states
function terf:entity/machines/mcfr/visuals/overpressure_particle_vent with entity @s data.terf
execute if score temp terf_states matches 5000000.. run function terf:entity/machines/mcfr/visuals/overpressure_particle_vent with entity @s data.terf
execute if score temp terf_states matches 10000000.. run function terf:entity/machines/mcfr/visuals/overpressure_particle_vent with entity @s data.terf
