#terminate when reaching max steps
scoreboard players remove terminated terf_states 1
execute if score terminated terf_states matches ..0 run return fail

#randomize rotation and length whilst keeping track via scoreboards
execute store result score length terf_states run random value 1000..2000
execute store result score slength terf_states run random value 1000..2000

execute store result score temp terf_states run random value -10000..10000
scoreboard players operation pitch terf_states += temp terf_states

execute store result score temp terf_states run random value -10000..10000
scoreboard players operation yaw terf_states += temp terf_states

#put the random values into a storage for macros
execute store result storage terf:temp args.pitch float 0.001 run scoreboard players get pitch terf_states
execute store result storage terf:temp args.yaw float 0.001 run scoreboard players get yaw terf_states
execute store result storage terf:temp args.hlength float 0.0005 run scoreboard players get length terf_states
execute store result storage terf:temp args.length float 0.001 run scoreboard players get length terf_states
execute store result storage terf:temp args.slength float 0.001 run scoreboard players get slength terf_states

#run the macros
function terf:require/lightning/step_args with storage terf:temp args

function terf:require/lightning/step
