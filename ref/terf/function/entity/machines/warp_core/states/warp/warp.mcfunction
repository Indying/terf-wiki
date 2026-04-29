#the great wall of checks
function terf:entity/machines/warp_core/validate/start
execute unless score @s terf_data_B matches 0 run return run tag @s add terf_warp_fail
execute unless score @s terf_data_C matches 0 run return run tag @s add terf_warp_fail
execute unless score @s terf_data_F >= @s terf_data_D run return run tag @s add terf_warp_fail
execute unless entity @s[tag=terf_containment] run return run tag @s add terf_warp_fail
execute unless entity @s[tag=terf_coils] run return run tag @s add terf_warp_fail
execute unless entity @s[tag=terf_injector_u] run return run tag @s add terf_warp_fail
execute unless entity @s[tag=terf_injector_d] run return run tag @s add terf_warp_fail
execute unless score @s terf_data_D matches 1.. run return run function terf:found_garbage {msg:"Blocks to move is below 1, this should not happen unless something is broken."}

#use power
scoreboard players operation @s terf_data_F -= @s terf_data_D
execute if score @s terf_data_F matches ..-1 run scoreboard players set @s terf_data_F 0

#warp
function terf:require/run_n_times {command:'playsound terf:explosion.warp_start master @a[distance=0..] ~ ~ ~ 20 1',n:10}
function terf:entity/machines/warp_core/states/warp/warp_args with storage terf:temp args
