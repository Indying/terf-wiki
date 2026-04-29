execute as @s[tag=terf_lamp_controller] run function terf:entity/machines/lamp_controller/lamps_off_instant
data modify entity @s data.terf.links set from storage terf:temp temp