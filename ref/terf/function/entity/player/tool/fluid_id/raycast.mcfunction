summon minecraft:marker ~ ~ ~ {UUID:[I;2215364,-5547793,-7547426,8438713],Tags:["terf_currententity"]}
execute as @e[type=minecraft:marker,tag=terf_multiblockcore,distance=..64] at @s run function terf:entity/player/tool/fluid_id/as_machines
kill 0021cdc4-ffab-58ef-ff8c-d5de0080c3b9
scoreboard players remove terminated terf_states 1
execute if score terminated terf_states matches ..0 run return run execute if score terminated terf_states matches 0 run playsound terf:alarms.toolbeep player @a[distance=0..] ~ ~ ~ 1 0
execute positioned ^ ^ ^.3 run function terf:entity/player/tool/fluid_id/raycast
