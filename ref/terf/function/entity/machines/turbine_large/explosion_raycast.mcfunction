scoreboard players remove terminated terf_states 1
execute if score terminated terf_states matches ..0 run return fail
execute unless block ~ ~ ~ air unless block ~ ~ ~ #terf:turbineblocks unless block ~ ~ ~ smooth_stone unless block ~ ~ ~ quartz_pillar unless block ~ ~ ~ chiseled_quartz_block unless block ~ ~ ~ iron_bars run return fail
execute positioned ~-.5 ~-.5 ~-.5 as @s[dx=0,dy=0,dz=0] run return run damage @s 40 minecraft:explosion
execute positioned ^ ^ ^1 run function terf:entity/machines/turbine_large/explosion_raycast
