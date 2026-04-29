execute unless block ~ ~ ~ air run return run kill @s
tp @s ^ ^ ^.4 ~-3 ~-2

execute if score @s terf_data_A matches -1.. run scoreboard players remove @s terf_data_A 20
execute if score @s terf_data_A matches ..-2 run return run function terf:entity/machines/stfr/states/meltdown/dust/fade

execute store result storage terf:temp args.temp int 1 run scoreboard players get @s terf_data_A
function terf:entity/machines/stfr/states/meltdown/dust/args with storage terf:temp args

