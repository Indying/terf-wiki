function terf:entity/machines/warp_core/before_warp with entity @s data.terf

#fix gravity
tag @s remove terf_nogravity
data modify entity @s NoGravity set value 0b

$execute in $(dimension) positioned as @s run tp @s ~$(x) ~$(y) ~$(z)
