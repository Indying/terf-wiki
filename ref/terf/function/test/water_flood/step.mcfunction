scoreboard players remove terminated terf_states 1
execute if score terminated terf_states matches ..-1 run return fail

particle electric_spark

execute if block ~ ~ ~ air run scoreboard players set terminated terf_states -1
execute if block ~ ~ ~ air run return run setblock ~ ~ ~ blue_stained_glass

execute if score terminated terf_states matches 0.. positioned ~ ~-1 ~ if function terf:test/water_flood/test run function terf:test/water_flood/step with storage terf:temp args
execute if score terminated terf_states matches 0.. positioned ~1 ~ ~ if function terf:test/water_flood/test run function terf:test/water_flood/step with storage terf:temp args
execute if score terminated terf_states matches 0.. positioned ~-1 ~ ~ if function terf:test/water_flood/test run function terf:test/water_flood/step with storage terf:temp args
execute if score terminated terf_states matches 0.. positioned ~ ~ ~1 if function terf:test/water_flood/test run function terf:test/water_flood/step with storage terf:temp args
execute if score terminated terf_states matches 0.. positioned ~ ~ ~-1 if function terf:test/water_flood/test run function terf:test/water_flood/step with storage terf:temp args
