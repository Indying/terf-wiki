execute unless block ~ ~ ~ #minecraft:air positioned ^ ^ ^-0.01 run return run function terf:entity/player/tool/custom_button/backcast

summon marker ~.03125 ~.03125 ~.03125 {UUID:[I;1101100,1101101,1100001,1101111]}
data modify storage terf:temp array set from entity 0010cd2c-0010-cd2d-0010-c8e10010cd37 Pos
execute store result storage terf:temp array[0] double 0.0625 run data get storage terf:temp array[0] 16
execute store result storage terf:temp array[1] double 0.0625 run data get storage terf:temp array[1] 16
execute store result storage terf:temp array[2] double 0.0625 run data get storage terf:temp array[2] 16
data modify entity 0010cd2c-0010-cd2d-0010-c8e10010cd37 Pos set from storage terf:temp array
