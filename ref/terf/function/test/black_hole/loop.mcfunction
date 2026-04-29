$execute rotated $(yaw) $(pitch) run function terf:test/black_hole/raycast
execute store result storage terf:temp args.yaw float 0.001 run random value 0..360000
execute store result storage terf:temp args.pitch float 0.001 run random value -90000..90000
scoreboard players remove terminated terf_states 1
execute if score terminated terf_states matches 1.. run function terf:test/black_hole/loop with storage terf:temp args
