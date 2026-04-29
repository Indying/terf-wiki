#calculate the average coordinates of blocks
scoreboard players set count terf_states 0
scoreboard players set x2 terf_states 0
scoreboard players set y2 terf_states 0
scoreboard players set z2 terf_states 0
summon marker ~ ~ ~ {UUID:[I;1101100,1101101,1100001,1101111]}
$function terf:require/run_spatial/run {x:$(size),y:$(size),z:$(size),command:'function terf:require/voxelizer/lib/calculate_center'}
kill 0010cd2c-0010-cd2d-0010-c8e10010cd37

scoreboard players operation x2 terf_states *= 16 terf_states
scoreboard players operation y2 terf_states *= 16 terf_states
scoreboard players operation z2 terf_states *= 16 terf_states
scoreboard players operation x2 terf_states /= count terf_states
scoreboard players operation y2 terf_states /= count terf_states
scoreboard players operation z2 terf_states /= count terf_states

#data conversion
scoreboard players add x2 terf_states 8
scoreboard players add y2 terf_states 8
scoreboard players add z2 terf_states 8

execute store result storage terf:temp temp[0] double 0.0625 run scoreboard players get x2 terf_states
execute store result storage terf:temp temp[1] double 0.0625 run scoreboard players get y2 terf_states
execute store result storage terf:temp temp[2] double 0.0625 run scoreboard players get z2 terf_states
data modify storage terf:temp test set from storage terf:temp temp

$function terf:require/run_spatial/run {x:$(size),y:$(size),z:$(size),command:'function terf:require/voxelizer/block_into_block_display'}
$fill ~ ~ ~ ~$(size) ~$(size) ~$(size) air