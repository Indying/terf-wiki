scoreboard players set terminated terf_states 30
execute store result storage terf:temp args.yaw float 0.001 run random value 0..360000
execute store result storage terf:temp args.pitch float 0.001 run random value -90000..90000
function terf:test/black_hole/loop with storage terf:temp args
