$execute if entity @s[tag=terf_stoneplate_rotatevertical] at @s run rotate @s ~$(horizontal) ~$(vertical)
$execute if entity @s[tag=!terf_stoneplate_rotatevertical] at @s run rotate @s ~$(horizontal) ~-$(vertical)
