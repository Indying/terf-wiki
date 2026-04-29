data merge entity @s {transformation:{scale:[0f,0f,0f]}}
execute store result entity @s transformation.translation[2] float 0.001 run data get entity @s transformation.translation[2] 2000
