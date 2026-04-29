#execute summon armor_stand run function terf:test/launch_as
#execute positioned as @s anchored eyes positioned ^ ^ ^-0.01 positioned ~ ~-0.9875 ~ summon armor_stand run function terf:test/launch_as
gamemode creative
execute at @s run tp @s ~ ~10000 ~
execute positioned as @s anchored eyes positioned ^ ^ ^-9 summon end_crystal run damage @s 0
execute at @s run tp @s ~ ~-10000 ~
#gamemode survival