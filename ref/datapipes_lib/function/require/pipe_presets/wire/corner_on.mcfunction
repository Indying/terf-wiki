setblock ~ ~ ~ red_glazed_terracotta[facing=west]
execute if block ~1 ~ ~ granite_slab[type=double] positioned ~1 ~ ~ run function datapipes_lib:require/pipe_presets/wire/corner_on
execute if block ~-1 ~ ~ granite_slab[type=double] positioned ~-1 ~ ~ run function datapipes_lib:require/pipe_presets/wire/corner_on
execute if block ~ ~1 ~ granite_slab[type=double] positioned ~ ~1 ~ run function datapipes_lib:require/pipe_presets/wire/corner_on
execute if block ~ ~-1 ~ granite_slab[type=double] positioned ~ ~-1 ~ run function datapipes_lib:require/pipe_presets/wire/corner_on
execute if block ~ ~ ~1 granite_slab[type=double] positioned ~ ~ ~1 run function datapipes_lib:require/pipe_presets/wire/corner_on
execute if block ~ ~ ~-1 granite_slab[type=double] positioned ~ ~ ~-1 run function datapipes_lib:require/pipe_presets/wire/corner_on

execute if block ~1 ~ ~ iron_chain[axis=x] positioned ~1 ~ ~ rotated 270 0 run function datapipes_lib:require/pipe_presets/wire/axis_x_on
execute if block ~-1 ~ ~ iron_chain[axis=x] positioned ~-1 ~ ~ rotated 90 0 run function datapipes_lib:require/pipe_presets/wire/axis_x_on
execute if block ~ ~1 ~ iron_chain[axis=y] positioned ~ ~1 ~ rotated 0 -90 run function datapipes_lib:require/pipe_presets/wire/axis_y_on
execute if block ~ ~-1 ~ iron_chain[axis=y] positioned ~ ~-1 ~ rotated 0 90 run function datapipes_lib:require/pipe_presets/wire/axis_y_on
execute if block ~ ~ ~1 iron_chain[axis=z] positioned ~ ~ ~1 rotated 0 0 run function datapipes_lib:require/pipe_presets/wire/axis_z_on
execute if block ~ ~ ~-1 iron_chain[axis=z] positioned ~ ~ ~-1 rotated 180 0 run function datapipes_lib:require/pipe_presets/wire/axis_z_on
