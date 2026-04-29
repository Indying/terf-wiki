execute store result storage terf:temp args2.pitch float 0.0001 run random value 150000..900000
execute store result storage terf:temp args2.yaw float 0.0001 run random value -1800000..1800000
data modify storage terf:temp args2.command set value 'function terf:entity/orbital_strike/raycast/raycast'

scoreboard players set terminated terf_states 100
function datapipes_lib:require/run_rotated with storage terf:temp args2
