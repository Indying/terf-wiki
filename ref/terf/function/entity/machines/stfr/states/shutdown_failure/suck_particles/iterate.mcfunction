execute store result entity 0010ccd2-0010-cd37-0010-cd360010c8e1 Rotation[0] float 0.001 run random value 1..360000
execute store result entity 0010ccd2-0010-cd37-0010-cd360010c8e1 Rotation[1] float 0.001 run random value -90000..90000
execute store result score temp terf_states run random value 1..60
execute rotated as 0010ccd2-0010-cd37-0010-cd360010c8e1 positioned ^ ^ ^4 run function terf:entity/machines/stfr/states/shutdown_failure/suck_particles/raycast

#execute store result storage terf:temp args.yaw float 0.001 run random value 1..360000
#execute store result storage terf:temp args.pitch float 0.001 run random value 1..90000
#execute store result storage terf:temp args.dist float 0.001 run random value 1..20000
#execute store result storage terf:temp args.speed int 1 run data get storage terf:temp args.dist 100000000
#function terf:entity/machines/stfr/states/shutdown_failure/suck_particles/args with storage terf:temp args

scoreboard players remove terminated terf_states 1
execute if score terminated terf_states matches 1.. run function terf:entity/machines/stfr/states/shutdown_failure/suck_particles/iterate
