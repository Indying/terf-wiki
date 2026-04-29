setblock ~ ~ ~ waxed_cut_copper
execute if block ~1 ~ ~ red_glazed_terracotta positioned ~1 ~ ~ run function datapipes_lib:require/pipe_presets/lightning_rod_convert/corner_off
execute if block ~-1 ~ ~ red_glazed_terracotta positioned ~-1 ~ ~ run function datapipes_lib:require/pipe_presets/lightning_rod_convert/corner_off
execute if block ~ ~1 ~ red_glazed_terracotta positioned ~ ~1 ~ run function datapipes_lib:require/pipe_presets/lightning_rod_convert/corner_off
execute if block ~ ~-1 ~ red_glazed_terracotta positioned ~ ~-1 ~ run function datapipes_lib:require/pipe_presets/lightning_rod_convert/corner_off
execute if block ~ ~ ~1 red_glazed_terracotta positioned ~ ~ ~1 run function datapipes_lib:require/pipe_presets/lightning_rod_convert/corner_off
execute if block ~ ~ ~-1 red_glazed_terracotta positioned ~ ~ ~-1 run function datapipes_lib:require/pipe_presets/lightning_rod_convert/corner_off

execute positioned ~1 ~ ~ if predicate datapipes_lib:lightning_rod_axis_x rotated 270 0 run function datapipes_lib:require/pipe_presets/lightning_rod_convert/axis_x_off
execute positioned ~-1 ~ ~ if predicate datapipes_lib:lightning_rod_axis_x rotated 90 0 run function datapipes_lib:require/pipe_presets/lightning_rod_convert/axis_x_off
execute positioned ~ ~1 ~ if predicate datapipes_lib:lightning_rod_axis_y rotated 0 -90 run function datapipes_lib:require/pipe_presets/lightning_rod_convert/axis_y_off
execute positioned ~ ~-1 ~ if predicate datapipes_lib:lightning_rod_axis_y rotated 0 90 run function datapipes_lib:require/pipe_presets/lightning_rod_convert/axis_y_off
execute positioned ~ ~ ~1 if predicate datapipes_lib:lightning_rod_axis_z rotated 0 0 run function datapipes_lib:require/pipe_presets/lightning_rod_convert/axis_z_off
execute positioned ~ ~ ~-1 if predicate datapipes_lib:lightning_rod_axis_z rotated 180 0 run function datapipes_lib:require/pipe_presets/lightning_rod_convert/axis_z_off
