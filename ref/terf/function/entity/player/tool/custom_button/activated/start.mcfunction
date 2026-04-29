data modify storage terf:temp args set value {}
execute store result storage terf:temp args.player_id int 1 run scoreboard players get @s terf_scorelink
function terf:entity/player/tool/custom_button/raycast_start
execute at 0010cd2c-0010-cd2d-0010-c8e10010cd37 run function terf:entity/player/tool/custom_button/activated/at_pos with storage terf:temp args
kill 0010cd2c-0010-cd2d-0010-c8e10010cd37
