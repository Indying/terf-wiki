execute if score volume terf_states > max_tank_volume terf_states run return fail
scoreboard players add volume terf_states 1
setblock ~ ~ ~ light[level=0]
execute positioned ~1 ~ ~ if function terf:entity/machines/fluid_tank/floodfill/check run function terf:entity/machines/fluid_tank/floodfill/step
execute positioned ~-1 ~ ~ if function terf:entity/machines/fluid_tank/floodfill/check run function terf:entity/machines/fluid_tank/floodfill/step
execute positioned ~ ~1 ~ if function terf:entity/machines/fluid_tank/floodfill/check run function terf:entity/machines/fluid_tank/floodfill/step
execute positioned ~ ~-1 ~ if function terf:entity/machines/fluid_tank/floodfill/check run function terf:entity/machines/fluid_tank/floodfill/step
execute positioned ~ ~ ~1 if function terf:entity/machines/fluid_tank/floodfill/check run function terf:entity/machines/fluid_tank/floodfill/step
execute positioned ~ ~ ~-1 if function terf:entity/machines/fluid_tank/floodfill/check run function terf:entity/machines/fluid_tank/floodfill/step
