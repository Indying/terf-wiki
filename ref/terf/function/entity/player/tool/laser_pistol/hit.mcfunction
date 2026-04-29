damage @s 0.8 terf:laser by @a[tag=terf_currententity,limit=1]
execute if entity @s[tag=terf_photon_ball] at @s run function terf:entity/photon_ball/blow
function terf:require/ignite_held_items
particle minecraft:flame ~.5 ~.5 ~.5 0 0 0 0 1 force