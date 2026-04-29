scoreboard players set @s terf_data_B 8
scoreboard players set temp terf_states 0
scoreboard players set terminated terf_states 0
execute positioned ^ ^ ^1 unless block ~ ~ ~ air run function terf:entity/machines/multi_piston/push_rod
execute unless score terminated terf_states matches 0.. run return fail
scoreboard players set temp terf_states 0
execute rotated ~ ~180 positioned ^ ^ ^1 run function terf:entity/machines/multi_piston/retract_rod

playsound minecraft:block.piston.contract master @a[distance=0..] ~ ~ ~ 2 0.6
playsound minecraft:block.piston.extend master @a[distance=0..] ~ ~ ~ 2 0.5