playsound block.heavy_core.break master @a[distance=0..]
kill @s
execute as @n[type=item_display,tag=terf_fire_extinguisher] run function terf:require/drop_item_display
