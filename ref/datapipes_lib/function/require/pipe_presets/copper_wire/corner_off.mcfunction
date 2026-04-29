setblock ~ ~ ~ waxed_cut_copper
execute if block ~1 ~ ~ red_glazed_terracotta positioned ~1 ~ ~ run function datapipes_lib:require/pipe_presets/copper_wire/corner_off
execute if block ~-1 ~ ~ red_glazed_terracotta positioned ~-1 ~ ~ run function datapipes_lib:require/pipe_presets/copper_wire/corner_off
execute if block ~ ~1 ~ red_glazed_terracotta positioned ~ ~1 ~ run function datapipes_lib:require/pipe_presets/copper_wire/corner_off
execute if block ~ ~-1 ~ red_glazed_terracotta positioned ~ ~-1 ~ run function datapipes_lib:require/pipe_presets/copper_wire/corner_off
execute if block ~ ~ ~1 red_glazed_terracotta positioned ~ ~ ~1 run function datapipes_lib:require/pipe_presets/copper_wire/corner_off
execute if block ~ ~ ~-1 red_glazed_terracotta positioned ~ ~ ~-1 run function datapipes_lib:require/pipe_presets/copper_wire/corner_off

execute if block ~1 ~ ~ waxed_oxidized_copper_chain[axis=x] positioned ~1 ~ ~ rotated 270 0 run function datapipes_lib:require/pipe_presets/copper_wire/axis_x_off
execute if block ~-1 ~ ~ waxed_oxidized_copper_chain[axis=x] positioned ~-1 ~ ~ rotated 90 0 run function datapipes_lib:require/pipe_presets/copper_wire/axis_x_off
execute if block ~ ~1 ~ waxed_oxidized_copper_chain[axis=y] positioned ~ ~1 ~ rotated 0 -90 run function datapipes_lib:require/pipe_presets/copper_wire/axis_y_off
execute if block ~ ~-1 ~ waxed_oxidized_copper_chain[axis=y] positioned ~ ~-1 ~ rotated 0 90 run function datapipes_lib:require/pipe_presets/copper_wire/axis_y_off
execute if block ~ ~ ~1 waxed_oxidized_copper_chain[axis=z] positioned ~ ~ ~1 rotated 0 0 run function datapipes_lib:require/pipe_presets/copper_wire/axis_z_off
execute if block ~ ~ ~-1 waxed_oxidized_copper_chain[axis=z] positioned ~ ~ ~-1 rotated 180 0 run function datapipes_lib:require/pipe_presets/copper_wire/axis_z_off
