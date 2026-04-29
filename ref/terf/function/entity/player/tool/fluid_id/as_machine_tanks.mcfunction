$execute positioned $(outpos) if entity @e[type=minecraft:marker,tag=terf_currententity,distance=..1] run return run function terf:entity/player/tool/fluid_id/as_target_tank with storage terf:temp temp[0]

data remove storage terf:temp temp[0]
execute if data storage terf:temp temp[0] run function terf:entity/player/tool/fluid_id/as_machine_tanks with storage terf:temp temp[0]
