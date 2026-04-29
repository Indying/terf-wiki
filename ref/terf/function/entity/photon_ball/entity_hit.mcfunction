damage @s 5 terf:high_voltage
effect give @s minecraft:slowness 3 143 true
effect give @s minecraft:mining_fatigue 10 255 true
effect give @s minecraft:weakness 10 255 true
effect give @s minecraft:darkness 10 255 true

playsound minecraft:entity.player.attack.crit master @a[distance=0..] ~ ~ ~ 1 0.5
playsound minecraft:entity.player.attack.crit master @a[distance=0..] ~ ~ ~ 1 0.6
playsound minecraft:entity.player.attack.crit master @a[distance=0..] ~ ~ ~ 1 0.7
playsound minecraft:entity.player.attack.crit master @a[distance=0..] ~ ~ ~ 1 0.8
particle minecraft:flame ~ ~1 ~ 0.2 0.4 0.2 0.2 100 force
particle minecraft:electric_spark ~ ~1 ~ 0.2 0.4 0.2 5 1000 force
particle minecraft:wax_off ~ ~1 ~ 0.2 0.4 0.2 5 100 force
