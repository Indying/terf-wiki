$execute positioned ~-0.5 ~-0.5 ~-0.5 run damage @n[type=!item,dx=0,dy=0,dz=0] $(dmg) terf:laser at ^ ^ ^-10

$execute if score axis terf_states matches 1 run return run particle minecraft:dust{scale:1,color:[$(r)f,$(g)f,$(b)f]} ~ ~ ~ 0.4 0 0 1 1
$execute if score axis terf_states matches 3 run return run particle minecraft:dust{scale:1,color:[$(r)f,$(g)f,$(b)f]} ~ ~ ~ 0 0 0.4 1 1
$execute if score axis terf_states matches 2 run particle minecraft:dust{scale:1,color:[$(r)f,$(g)f,$(b)f]} ~ ~ ~ 0 0.4 0 1 1