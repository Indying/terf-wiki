advancement revoke @s only terf:internal/pressed_button
execute as @e[type=marker,tag=terf_elevator,distance=0..] at @s run function terf:entity/machines/gear_elevator/button_checks/check_buttons
execute as @e[type=marker,tag=terf_hadron_collider] at @s run function datapipes_lib:require/run_at with entity @s data.terf.hadron_collider.panel_coords
execute as @e[type=marker,tag=terf_assembler] at @s positioned ^2.4999 ^-0.4999 ^-4.4999 run function terf:entity/machines/assembler/checks with entity @s data.terf