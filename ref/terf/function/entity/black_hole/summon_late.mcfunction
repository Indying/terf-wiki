summon minecraft:marker ~ ~ ~ {Tags:["terf_black_hole"]}
scoreboard players set @n[tag=terf_black_hole] terf_data_A 2999

execute positioned ~1 ~ ~ unless block ~ ~ ~ #terf:indestructible run setblock ~ ~ ~ air destroy
execute positioned ~-1 ~ ~ unless block ~ ~ ~ #terf:indestructible run setblock ~ ~ ~ air destroy
execute positioned ~ ~1 ~ unless block ~ ~ ~ #terf:indestructible run setblock ~ ~ ~ air destroy
execute positioned ~ ~-1 ~ unless block ~ ~ ~ #terf:indestructible run setblock ~ ~ ~ air destroy
execute positioned ~ ~ ~1 unless block ~ ~ ~ #terf:indestructible run setblock ~ ~ ~ air destroy
execute positioned ~ ~ ~-1 unless block ~ ~ ~ #terf:indestructible run setblock ~ ~ ~ air destroy

function terf:require/run_n_times {n:100,command:'function terf:entity/black_hole/summon_beam'}