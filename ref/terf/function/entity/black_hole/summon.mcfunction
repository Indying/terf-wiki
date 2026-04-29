summon minecraft:marker ~ ~ ~ {Tags:["terf_black_hole"]}

execute positioned ~1 ~ ~ unless block ~ ~ ~ #terf:indestructible run setblock ~ ~ ~ air destroy
execute positioned ~-1 ~ ~ unless block ~ ~ ~ #terf:indestructible run setblock ~ ~ ~ air destroy
execute positioned ~ ~1 ~ unless block ~ ~ ~ #terf:indestructible run setblock ~ ~ ~ air destroy
execute positioned ~ ~-1 ~ unless block ~ ~ ~ #terf:indestructible run setblock ~ ~ ~ air destroy
execute positioned ~ ~ ~1 unless block ~ ~ ~ #terf:indestructible run setblock ~ ~ ~ air destroy
execute positioned ~ ~ ~-1 unless block ~ ~ ~ #terf:indestructible run setblock ~ ~ ~ air destroy

particle minecraft:end_rod ~ ~ ~ 0 0 0 1 10 force

function terf:require/run_n_times {n:10,command:'playsound terf:explosion.rocketfly ambient @a[distance=0..] ~ ~ ~ 2 0'}

function terf:require/run_n_times {n:100,command:'function terf:entity/black_hole/summon_beam'}