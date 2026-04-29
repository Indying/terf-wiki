execute store result storage terf:temp temp[0] double 0.005 run random value -1000..1000
execute store result storage terf:temp temp[1] double 0.005 run random value -1000..1000
execute store result storage terf:temp temp[2] double 0.005 run random value -1000..1000
data modify entity @s Motion set from storage terf:temp temp

execute if block ~ ~ ~ air run function terf:entity/machines/pressurizer/stand/setblock
execute positioned over motion_blocking_no_leaves if entity @s[dy=100000] run function terf:entity/machines/pressurizer/stand/depressurize
