execute unless block ~ ~ ~0.01 #minecraft:air if block ~ ~ ~-0.01 #minecraft:air run scoreboard players operation tz terf_states *= -1 terf_states
execute unless block ~ ~ ~0.01 #minecraft:air if block ~ ~ ~-0.01 #minecraft:air run return run scoreboard players remove tz terf_states 2

execute unless block ~0.01 ~ ~ #minecraft:air run scoreboard players operation tx terf_states *= -1 terf_states
execute unless block ~0.01 ~ ~ #minecraft:air run return run scoreboard players remove tx terf_states 2

execute unless block ~-0.01 ~ ~ #minecraft:air run scoreboard players operation tx terf_states *= -1 terf_states
execute unless block ~-0.01 ~ ~ #minecraft:air run scoreboard players add tx terf_states 2

execute unless block ~ ~ ~-0.01 #minecraft:air run scoreboard players operation tz terf_states *= -1 terf_states
execute unless block ~ ~ ~-0.01 #minecraft:air run scoreboard players add tz terf_states 2
