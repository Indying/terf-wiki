setblock ~ ~ ~ granite_slab[type=double]
execute if block ~1 ~ ~ red_glazed_terracotta[facing=south] positioned ~1 ~ ~ run function terf:entity/machines/solar_panel/wire_checks/corner_off
execute if block ~-1 ~ ~ red_glazed_terracotta[facing=south] positioned ~-1 ~ ~ run function terf:entity/machines/solar_panel/wire_checks/corner_off
execute if block ~ ~1 ~ red_glazed_terracotta[facing=south] positioned ~ ~1 ~ run function terf:entity/machines/solar_panel/wire_checks/corner_off
execute if block ~ ~-1 ~ red_glazed_terracotta[facing=south] positioned ~ ~-1 ~ run function terf:entity/machines/solar_panel/wire_checks/corner_off
execute if block ~ ~ ~1 red_glazed_terracotta[facing=south] positioned ~ ~ ~1 run function terf:entity/machines/solar_panel/wire_checks/corner_off
execute if block ~ ~ ~-1 red_glazed_terracotta[facing=south] positioned ~ ~ ~-1 run function terf:entity/machines/solar_panel/wire_checks/corner_off

execute if block ~1 ~ ~ iron_chain[axis=x] positioned ~1 ~ ~ rotated 270 0 run function terf:entity/machines/solar_panel/wire_checks/axis_x_off
execute if block ~-1 ~ ~ iron_chain[axis=x] positioned ~-1 ~ ~ rotated 90 0 run function terf:entity/machines/solar_panel/wire_checks/axis_x_off
execute if block ~ ~1 ~ iron_chain[axis=y] positioned ~ ~1 ~ rotated 0 -90 run function terf:entity/machines/solar_panel/wire_checks/axis_y_off
execute if block ~ ~-1 ~ iron_chain[axis=y] positioned ~ ~-1 ~ rotated 0 90 run function terf:entity/machines/solar_panel/wire_checks/axis_y_off
execute if block ~ ~ ~1 iron_chain[axis=z] positioned ~ ~ ~1 rotated 0 0 run function terf:entity/machines/solar_panel/wire_checks/axis_z_off
execute if block ~ ~ ~-1 iron_chain[axis=z] positioned ~ ~ ~-1 rotated 180 0 run function terf:entity/machines/solar_panel/wire_checks/axis_z_off
