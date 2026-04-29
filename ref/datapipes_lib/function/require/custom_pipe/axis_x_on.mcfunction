$execute if block ^ ^ ^1 $(axis)[axis=x] positioned ^ ^ ^1 run return run function datapipes_lib:require/custom_pipe/axis_x_on with storage datapipes_lib:temp args
$execute if block ^ ^ ^1 $(corner) positioned ^ ^ ^1 run return run function datapipes_lib:require/custom_pipe/corner_on with storage datapipes_lib:temp args
execute if block ^ ^ ^1 lodestone positioned ^ ^ ^1 run function datapipes_lib:require/custom_pipe/axis_x_on with storage datapipes_lib:temp args
