setblock ~ ~ ~ red_glazed_terracotta
execute if block ~1 ~ ~ waxed_cut_copper positioned ~1 ~ ~ run function datapipes_lib:require/pipe_presets/lightning_rod/corner_on
execute if block ~-1 ~ ~ waxed_cut_copper positioned ~-1 ~ ~ run function datapipes_lib:require/pipe_presets/lightning_rod/corner_on
execute if block ~ ~1 ~ waxed_cut_copper positioned ~ ~1 ~ run function datapipes_lib:require/pipe_presets/lightning_rod/corner_on
execute if block ~ ~-1 ~ waxed_cut_copper positioned ~ ~-1 ~ run function datapipes_lib:require/pipe_presets/lightning_rod/corner_on
execute if block ~ ~ ~1 waxed_cut_copper positioned ~ ~ ~1 run function datapipes_lib:require/pipe_presets/lightning_rod/corner_on
execute if block ~ ~ ~-1 waxed_cut_copper positioned ~ ~ ~-1 run function datapipes_lib:require/pipe_presets/lightning_rod/corner_on

execute positioned ~1 ~ ~ if predicate datapipes_lib:lightning_rod_axis_x rotated 270 0 run function datapipes_lib:require/pipe_presets/lightning_rod/axis_x_on
execute positioned ~-1 ~ ~ if predicate datapipes_lib:lightning_rod_axis_x rotated 90 0 run function datapipes_lib:require/pipe_presets/lightning_rod/axis_x_on
execute positioned ~ ~1 ~ if predicate datapipes_lib:lightning_rod_axis_y rotated 0 -90 run function datapipes_lib:require/pipe_presets/lightning_rod/axis_y_on
execute positioned ~ ~-1 ~ if predicate datapipes_lib:lightning_rod_axis_y rotated 0 90 run function datapipes_lib:require/pipe_presets/lightning_rod/axis_y_on
execute positioned ~ ~ ~1 if predicate datapipes_lib:lightning_rod_axis_z rotated 0 0 run function datapipes_lib:require/pipe_presets/lightning_rod/axis_z_on
execute positioned ~ ~ ~-1 if predicate datapipes_lib:lightning_rod_axis_z rotated 180 0 run function datapipes_lib:require/pipe_presets/lightning_rod/axis_z_on
