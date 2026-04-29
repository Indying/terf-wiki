particle flame ~ ~ ~ ^ ^ ^100000000 0.000000001 0 force
particle small_flame ^ ^ ^5 ^ ^100000000 ^ 0.000000001 0 force
rotate @s ~5 ~-1

$execute facing entity @n[type=marker,tag=terf_stfr] feet run tp @s ^$(x) ^$(y) ^$(z)

execute at @s if block ~ ~ ~ air run return fail
particle flame ~ ~ ~ 0.1 0.1 0.1 0.1 10 force
kill @s
setblock ~ ~ ~ fire keep