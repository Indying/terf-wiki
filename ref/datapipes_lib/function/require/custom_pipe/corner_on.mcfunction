setblock ~ ~ ~ red_glazed_terracotta
$execute if block ~1 ~ ~ $(corner) positioned ~1 ~ ~ run function datapipes_lib:require/custom_pipe/corner_on with storage datapipes_lib:temp args
$execute if block ~-1 ~ ~ $(corner) positioned ~-1 ~ ~ run function datapipes_lib:require/custom_pipe/corner_on with storage datapipes_lib:temp args
$execute if block ~ ~1 ~ $(corner) positioned ~ ~1 ~ run function datapipes_lib:require/custom_pipe/corner_on with storage datapipes_lib:temp args
$execute if block ~ ~-1 ~ $(corner) positioned ~ ~-1 ~ run function datapipes_lib:require/custom_pipe/corner_on with storage datapipes_lib:temp args
$execute if block ~ ~ ~1 $(corner) positioned ~ ~ ~1 run function datapipes_lib:require/custom_pipe/corner_on with storage datapipes_lib:temp args
$execute if block ~ ~ ~-1 $(corner) positioned ~ ~ ~-1 run function datapipes_lib:require/custom_pipe/corner_on with storage datapipes_lib:temp args

$execute if block ~1 ~ ~ $(axis)[axis=x] positioned ~1 ~ ~ rotated 270 0 run function datapipes_lib:require/custom_pipe/axis_x_on with storage datapipes_lib:temp args
$execute if block ~-1 ~ ~ $(axis)[axis=x] positioned ~-1 ~ ~ rotated 90 0 run function datapipes_lib:require/custom_pipe/axis_x_on with storage datapipes_lib:temp args
$execute if block ~ ~1 ~ $(axis)[axis=y] positioned ~ ~1 ~ rotated 0 -90 run function datapipes_lib:require/custom_pipe/axis_y_on with storage datapipes_lib:temp args
$execute if block ~ ~-1 ~ $(axis)[axis=y] positioned ~ ~-1 ~ rotated 0 90 run function datapipes_lib:require/custom_pipe/axis_y_on with storage datapipes_lib:temp args
$execute if block ~ ~ ~1 $(axis)[axis=z] positioned ~ ~ ~1 rotated 0 0 run function datapipes_lib:require/custom_pipe/axis_z_on with storage datapipes_lib:temp args
$execute if block ~ ~ ~-1 $(axis)[axis=z] positioned ~ ~ ~-1 rotated 180 0 run function datapipes_lib:require/custom_pipe/axis_z_on with storage datapipes_lib:temp args
