data modify storage terf:temp args set value {horizontal:{axis:[1.0f,0.0f,0.0f],angle:0},vertical:{axis:[0.0f,1.0f,0.0f],angle:0}}

execute store result storage terf:temp args.horizontal.angle float 0.001 store result storage terf:temp args.vertical.angle float 0.001 run scoreboard players get @s terf_data_V
$execute as @e[type=minecraft:item_display,tag=terf_related_$(machine_id),tag=terf_stab_rotor] run function terf:entity/machines/stfr/visuals/stabilizer/rotation/as_rotor
