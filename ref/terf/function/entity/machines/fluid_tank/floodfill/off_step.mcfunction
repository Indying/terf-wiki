setblock ~ ~ ~ air
execute positioned ~1 ~ ~ if block ~ ~ ~ light[level=0] run function terf:entity/machines/fluid_tank/floodfill/off_step
execute positioned ~-1 ~ ~ if block ~ ~ ~ light[level=0] run function terf:entity/machines/fluid_tank/floodfill/off_step
execute positioned ~ ~1 ~ if block ~ ~ ~ light[level=0] run function terf:entity/machines/fluid_tank/floodfill/off_step
execute positioned ~ ~-1 ~ if block ~ ~ ~ light[level=0] run function terf:entity/machines/fluid_tank/floodfill/off_step
execute positioned ~ ~ ~1 if block ~ ~ ~ light[level=0] run function terf:entity/machines/fluid_tank/floodfill/off_step
execute positioned ~ ~ ~-1 if block ~ ~ ~ light[level=0] run function terf:entity/machines/fluid_tank/floodfill/off_step
