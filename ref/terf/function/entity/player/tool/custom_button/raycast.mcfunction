scoreboard players remove terminated terf_states 1
execute if score terminated terf_states matches ..0 run return fail
execute if block ~ ~ ~ #minecraft:air positioned ^ ^ ^0.1 run return run function terf:entity/player/tool/custom_button/raycast
function terf:entity/player/tool/custom_button/backcast
