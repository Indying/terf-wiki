#add to length and raycast until it hits a block
scoreboard players add length terf_states 1
scoreboard players remove terminated terf_states 1

scoreboard players operation temp terf_states = terminated terf_states
scoreboard players operation temp terf_states %= 10 terf_states
execute if score temp terf_states matches 0 positioned ~-.5 ~-.5 ~-.5 as @e[type=!item,dx=0,dy=0,dz=0,tag=!terf_currententity] if function terf:entity/vehicle/mrt/beam/can_be_hit run return run function terf:entity/vehicle/mrt/beam/as_hit_entity

execute positioned ^ ^ ^0.1 if block ~ ~ ~ #terf:laser_can_go_through if score terminated terf_states matches 1.. run return run function terf:entity/vehicle/mrt/beam/step

#put the values into a storage for macros
execute store result storage terf:temp args.pitch float 0.001 run scoreboard players get pitch terf_states
execute store result storage terf:temp args.yaw float 0.001 run scoreboard players get yaw terf_states
execute store result storage terf:temp args.length float 0.1 run scoreboard players get length terf_states

#figure out the angle of reflection
execute unless block ~ ~-.1 ~ #terf:laser_can_go_through run scoreboard players operation pitch terf_states /= -1 terf_states
execute unless block ~ ~.1 ~ #terf:laser_can_go_through run scoreboard players operation pitch terf_states /= -1 terf_states

execute unless block ~.1 ~ ~ #terf:laser_can_go_through run scoreboard players operation yaw terf_states /= -1 terf_states
execute unless block ~-.1 ~ ~ #terf:laser_can_go_through run scoreboard players operation yaw terf_states /= -1 terf_states

execute unless block ~ ~ ~.1 #terf:laser_can_go_through run function terf:entity/vehicle/mrt/beam/raycast_hit_z
execute unless block ~ ~ ~-.1 #terf:laser_can_go_through run function terf:entity/vehicle/mrt/beam/raycast_hit_z

#put the reflection values into a storage for macros
execute store result storage terf:temp args.rpitch float 0.001 run scoreboard players get pitch terf_states
execute store result storage terf:temp args.ryaw float 0.001 run scoreboard players get yaw terf_states
scoreboard players set length terf_states 0

#when it hits a block, summon an item display with the length of the bullet tracing back its path, also stop it if its hitting the height limit or barriers
execute if score oldmapadditions_installed terfmap_states matches 1 if block ^ ^ ^.1 barrier run return fail
function terf:entity/vehicle/mrt/beam/step_args with storage terf:temp args
