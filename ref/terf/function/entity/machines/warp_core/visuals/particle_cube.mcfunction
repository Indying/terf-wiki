execute store result score x terf_states run data get storage terf:temp args.x 1000
execute store result score y terf_states run data get storage terf:temp args.y 1000
execute store result score z terf_states run data get storage terf:temp args.z 1000

$execute store result score rx terf_states run random value 0..$(size_x)
$execute store result score ry terf_states run random value 0..$(size_y)
$execute store result score rz terf_states run random value 0..$(size_z)
execute store result storage terf:temp args.rx float 0.001 run scoreboard players operation rx terf_states += x terf_states
execute store result storage terf:temp args.ry float 0.001 run scoreboard players operation ry terf_states += y terf_states
execute store result storage terf:temp args.rz float 0.001 run scoreboard players operation rz terf_states += z terf_states

$execute store result storage terf:temp args.mx float 0.001 run scoreboard players add x terf_states $(size_x)
$execute store result storage terf:temp args.my float 0.001 run scoreboard players add y terf_states $(size_y)
$execute store result storage terf:temp args.mz float 0.001 run scoreboard players add z terf_states $(size_z)

execute store result storage terf:temp args.speed_x float 0.005 run data get storage terf:temp args.size_x
execute store result storage terf:temp args.speed_y float 0.005 run data get storage terf:temp args.size_y
execute store result storage terf:temp args.speed_z float 0.005 run data get storage terf:temp args.size_z

function terf:entity/machines/warp_core/visuals/particle_cube_args with storage terf:temp args
