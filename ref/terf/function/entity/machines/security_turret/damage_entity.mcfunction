execute if entity @s[gamemode=spectator] run return fail
damage @s 1 terf:security_turret at ^ ^ ^-10
effect give @s minecraft:slowness 1 255 true
effect give @s minecraft:mining_fatigue 1 255 true
particle minecraft:electric_spark ~ ~1 ~ 0.1 0.3 0.1 0.1 10 force
scoreboard players set temp2 terf_states 1