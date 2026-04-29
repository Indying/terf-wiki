tp @s ~ ~ ~ facing entity @e[type=marker,limit=1,tag=terf_multiblockcore,sort=nearest]
execute unless block ~ ~1 ~ air run kill @s
particle end_rod ~ ~1 ~