$execute store result storage terf:temp args2.pitch float 0.0001 run random value -$(min_pitch)..$(max_pitch)
execute store result storage terf:temp args2.yaw float 0.0001 run random value -1800000..1800000
$data modify storage terf:temp args2.command set value '$(command)'

function datapipes_lib:require/run_rotated with storage terf:temp args2
