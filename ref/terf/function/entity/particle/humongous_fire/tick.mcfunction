scoreboard players set temp terf_states 750
scoreboard players operation temp terf_states -= @s terf_data_A
execute store result entity @s text_opacity byte 0.3 run scoreboard players get temp terf_states

execute as @s[tag=terf_random_vel] run function terf:entity/particle/humongous_fire/random_velocity
scoreboard players add @s terf_data_X 2
scoreboard players add @s terf_data_Y 3
scoreboard players add @s terf_data_Z 2

######################################################################################################
scoreboard players set temp terf_states 250
scoreboard players operation temp terf_states -= @s terf_data_A
execute if score temp terf_states matches ..-1 run scoreboard players set temp terf_states 0
scoreboard players operation temp terf_states /= 3 terf_states
scoreboard players operation temp terf_states *= temp terf_states

#calculate blackbody color
data modify storage terf:temp args set value {arg1:'data modify entity @s text.color set from storage terf:constants blackbody_hex.'}
execute store result storage terf:temp args.arg2 int 0.1 run scoreboard players get temp terf_states
function datapipes_lib:require/with_args/2 with storage terf:temp args
