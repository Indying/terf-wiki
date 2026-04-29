execute if block ~ ~ ~ #minecraft:air run return 1
execute if block ~ ~ ~ light[level=0] run return fail
execute if block ~ ~ ~ #terf:tank_blocks run return run function terf:entity/machines/fluid_tank/floodfill/add_to_array
scoreboard players set volume terf_states 2100000000
