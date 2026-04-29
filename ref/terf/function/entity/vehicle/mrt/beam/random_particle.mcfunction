execute store result storage terf:temp args.yaw float 0.001 run random value -10000..10000
execute store result storage terf:temp args.pitch float 0.001 run random value -10000..10000
execute store result storage terf:temp args.force int 100000 run random value 2000..10000
function terf:entity/vehicle/mrt/beam/random_particle_shoot with storage terf:temp args

scoreboard players remove terminated terf_states 1
execute if score terminated terf_states matches 0.. run function terf:entity/vehicle/mrt/beam/random_particle