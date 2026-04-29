execute store result storage terf:temp args2.pitch float 0.0001 run random value -900000..900000
execute store result storage terf:temp args2.yaw float 0.0001 run random value -1800000..1800000
data modify storage terf:temp args2.command set value 'function terf:entity/machines/warp_core/states/detonation/raycast/raycast'

scoreboard players set terminated terf_states 120
function datapipes_lib:require/run_rotated with storage terf:temp args2
