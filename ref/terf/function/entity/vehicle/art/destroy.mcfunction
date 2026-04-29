playsound minecraft:block.heavy_core.break player @a[distance=0..] ~ ~ ~ 2 0
playsound minecraft:block.heavy_core.break player @a[distance=0..] ~ ~ ~ 2 0
playsound minecraft:block.heavy_core.break player @a[distance=0..] ~ ~ ~ 2 0
playsound minecraft:block.heavy_core.break player @a[distance=0..] ~ ~ ~ 2 0
playsound minecraft:block.heavy_core.break player @a[distance=0..] ~ ~ ~ 2 0
playsound minecraft:block.heavy_core.break player @a[distance=0..] ~ ~ ~ 2 0
playsound minecraft:block.heavy_core.break player @a[distance=0..] ~ ~ ~ 2 0
particle minecraft:crit ~ ~-1.3 ~ 0.5 0.1 0.5 0.1 500 force
particle minecraft:crit ~ ~-0.25 ~ 0.1 0.5 0.1 0.1 500 force

execute on passengers if entity @s[type=minecraft:marker] if data entity @s data.terf.security_config run function terf:entity/machines/security_turret/explosion

execute on passengers run kill @s
kill @s
