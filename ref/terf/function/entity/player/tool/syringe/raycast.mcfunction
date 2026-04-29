#summon a marker to mark the current position
summon minecraft:marker ~ ~ ~ {UUID:[I;2215364,-5547793,-7547426,8438713],Tags:["terf_currententity"]}
execute as @e[type=minecraft:marker,tag=terf_multiblockcore,distance=..256] at @s run function terf:entity/player/tool/syringe/as_machines
kill 0021cdc4-ffab-58ef-ff8c-d5de0080c3b9

#continue raycast
scoreboard players remove terminated terf_states 1
execute unless score terminated terf_states matches ..0 positioned ^ ^ ^.2 run function terf:entity/player/tool/syringe/raycast
