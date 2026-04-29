setblock ~ ~ ~ red_glazed_terracotta
$execute positioned ~1 ~ ~ if block ~ ~ ~ $(corner) run function terf:entity/machines/hadron_collider/panel_checks/corner_on with storage datapipes_lib:temp args
$execute positioned ~-1 ~ ~ if block ~ ~ ~ $(corner) run function terf:entity/machines/hadron_collider/panel_checks/corner_on with storage datapipes_lib:temp args
$execute positioned ~ ~1 ~ if block ~ ~ ~ $(corner) run function terf:entity/machines/hadron_collider/panel_checks/corner_on with storage datapipes_lib:temp args
$execute positioned ~ ~-1 ~ if block ~ ~ ~ $(corner) run function terf:entity/machines/hadron_collider/panel_checks/corner_on with storage datapipes_lib:temp args
$execute positioned ~ ~ ~1 if block ~ ~ ~ $(corner) run function terf:entity/machines/hadron_collider/panel_checks/corner_on with storage datapipes_lib:temp args
$execute positioned ~ ~ ~-1 if block ~ ~ ~ $(corner) run function terf:entity/machines/hadron_collider/panel_checks/corner_on with storage datapipes_lib:temp args

$execute positioned ~1 ~ ~ if $(axis_x) rotated 270 0 run function terf:entity/machines/hadron_collider/panel_checks/axis_x_on with storage datapipes_lib:temp args
$execute positioned ~-1 ~ ~ if $(axis_x) rotated 90 0 run function terf:entity/machines/hadron_collider/panel_checks/axis_x_on with storage datapipes_lib:temp args
$execute positioned ~ ~1 ~ if $(axis_y) rotated 0 -90 run function terf:entity/machines/hadron_collider/panel_checks/axis_y_on with storage datapipes_lib:temp args
$execute positioned ~ ~-1 ~ if $(axis_y) rotated 0 90 run function terf:entity/machines/hadron_collider/panel_checks/axis_y_on with storage datapipes_lib:temp args
$execute positioned ~ ~ ~1 if $(axis_z) rotated 0 0 run function terf:entity/machines/hadron_collider/panel_checks/axis_z_on with storage datapipes_lib:temp args
$execute positioned ~ ~ ~-1 if $(axis_z) rotated 180 0 run function terf:entity/machines/hadron_collider/panel_checks/axis_z_on with storage datapipes_lib:temp args
