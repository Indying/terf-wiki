$execute positioned ^ ^ ^1 if $(axis_y) run return run function terf:entity/machines/hadron_collider/panel_checks/axis_y_on with storage datapipes_lib:temp args
$execute positioned ^ ^ ^1 if block ~ ~ ~ $(corner) run function terf:entity/machines/hadron_collider/panel_checks/corner_on with storage datapipes_lib:temp args

execute positioned ~ ~-1 ~ if block ~ ~ ~ minecraft:waxed_exposed_cut_copper_stairs run function terf:entity/machines/hadron_collider/panel_checks/check_direction
execute positioned ~ ~2 ~ if block ~ ~ ~ minecraft:waxed_exposed_cut_copper_stairs run function terf:entity/machines/hadron_collider/panel_checks/check_direction