#check if the marker is at the tanks output
$execute positioned $(outpos) positioned ~-.5 ~-.5 ~-.5 if entity @e[type=minecraft:marker,tag=terf_currententity,dx=0,dy=0,dz=0] run return run function terf:entity/player/tool/syringe/as_target_tank with storage terf:temp syringe_tanks[0]

#continue iterating
data remove storage terf:temp syringe_tanks[0]
execute if data storage terf:temp syringe_tanks[0] run function terf:entity/player/tool/syringe/as_machine_tanks with storage terf:temp syringe_tanks[0]
