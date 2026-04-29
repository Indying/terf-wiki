$execute positioned ~-$(power) ~-$(power) ~-$(power) positioned ~-.5 ~-.5 ~-.5 as @e[tag=!terf_no_ray_damage,dx=$(dpower),dy=$(dpower),dz=$(dpower),type=!item] run function terf:entity/player/tool/tau_cannon/hit_entity with storage terf:temp args2

$particle minecraft:electric_spark ~ ~ ~ 0 0 0 $(power) 1 force
$particle dust{scale:0.8,color:[1.0,$(power),0.0]} ~ ~ ~ 0 0 0 0 1 force
