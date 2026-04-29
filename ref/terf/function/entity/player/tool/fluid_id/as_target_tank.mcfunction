scoreboard players set terminated terf_states -1

scoreboard players set temp terf_states 0
execute as @p[tag=terf_currententity] if predicate datapipes_lib:pressing_sneak run scoreboard players set temp terf_states 1
execute if score temp terf_states matches 0 run function terf:entity/player/tool/fluid_id/set_fluid_type with storage terf:temp temp[0]
execute if score temp terf_states matches 1 run function terf:entity/player/tool/fluid_id/copy_fluid_type with storage terf:temp temp[0]
