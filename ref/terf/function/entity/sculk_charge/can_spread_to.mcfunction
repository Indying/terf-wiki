execute if block ~ ~ ~ #terf:sculk_resistant run return fail
execute if block ~ ~ ~ #terf:sculk_nonsolid run return fail
execute unless block ~1 ~ ~ #terf:sculk_nonsolid unless block ~-1 ~ ~ #terf:sculk_nonsolid unless block ~ ~1 ~ #terf:sculk_nonsolid unless block ~ ~-1 ~ #terf:sculk_nonsolid unless block ~ ~ ~1 #terf:sculk_nonsolid unless block ~ ~ ~-1 #terf:sculk_nonsolid run return fail
return 1