scoreboard players operation x terf_states = @s terf_data_U
scoreboard players operation y terf_states = @s terf_data_V
scoreboard players operation z terf_states = @s terf_data_W
scoreboard players operation x terf_states *= 2 terf_states
scoreboard players operation y terf_states *= 2 terf_states
scoreboard players operation z terf_states *= 2 terf_states
scoreboard players add x terf_states 1
scoreboard players add y terf_states 1
scoreboard players add z terf_states 1
execute store result storage terf:temp args.Uaxis_x int 1 run scoreboard players get x terf_states
execute store result storage terf:temp args.Uaxis_y int 1 run scoreboard players get y terf_states
execute store result storage terf:temp args.Uaxis_z int 1 run scoreboard players get z terf_states

execute store result storage terf:temp args.axis_x int 1 run scoreboard players get @s terf_data_U
execute store result storage terf:temp args.axis_y int 1 run scoreboard players get @s terf_data_V
execute store result storage terf:temp args.axis_z int 1 run scoreboard players get @s terf_data_W

data modify storage terf:temp args.teleport_duration set value 1
function terf:entity/machines/warp_core/visuals/summon_cube with storage terf:temp args
data modify storage terf:temp args.teleport_duration set value 2
function terf:entity/machines/warp_core/visuals/summon_cube with storage terf:temp args
data modify storage terf:temp args.teleport_duration set value 3
function terf:entity/machines/warp_core/visuals/summon_cube with storage terf:temp args
data modify storage terf:temp args.teleport_duration set value 4
function terf:entity/machines/warp_core/visuals/summon_cube with storage terf:temp args
data modify storage terf:temp args.teleport_duration set value 5
function terf:entity/machines/warp_core/visuals/summon_cube with storage terf:temp args
data modify storage terf:temp args.teleport_duration set value 6
function terf:entity/machines/warp_core/visuals/summon_cube with storage terf:temp args
data modify storage terf:temp args.teleport_duration set value 7
function terf:entity/machines/warp_core/visuals/summon_cube with storage terf:temp args
data modify storage terf:temp args.teleport_duration set value 8
function terf:entity/machines/warp_core/visuals/summon_cube with storage terf:temp args
data modify storage terf:temp args.teleport_duration set value 9
function terf:entity/machines/warp_core/visuals/summon_cube with storage terf:temp args
data modify storage terf:temp args.teleport_duration set value 10
function terf:entity/machines/warp_core/visuals/summon_cube with storage terf:temp args
data modify storage terf:temp args.teleport_duration set value 11
function terf:entity/machines/warp_core/visuals/summon_cube with storage terf:temp args
data modify storage terf:temp args.teleport_duration set value 12
function terf:entity/machines/warp_core/visuals/summon_cube with storage terf:temp args
data modify storage terf:temp args.teleport_duration set value 13
function terf:entity/machines/warp_core/visuals/summon_cube with storage terf:temp args
data modify storage terf:temp args.teleport_duration set value 14
function terf:entity/machines/warp_core/visuals/summon_cube with storage terf:temp args
data modify storage terf:temp args.teleport_duration set value 15
function terf:entity/machines/warp_core/visuals/summon_cube with storage terf:temp args
data modify storage terf:temp args.teleport_duration set value 16
function terf:entity/machines/warp_core/visuals/summon_cube with storage terf:temp args
data modify storage terf:temp args.teleport_duration set value 17
function terf:entity/machines/warp_core/visuals/summon_cube with storage terf:temp args
data modify storage terf:temp args.teleport_duration set value 18
function terf:entity/machines/warp_core/visuals/summon_cube with storage terf:temp args
data modify storage terf:temp args.teleport_duration set value 19
function terf:entity/machines/warp_core/visuals/summon_cube with storage terf:temp args
data modify storage terf:temp args.teleport_duration set value 20
function terf:entity/machines/warp_core/visuals/summon_cube with storage terf:temp args
data modify storage terf:temp args.teleport_duration set value 21
function terf:entity/machines/warp_core/visuals/summon_cube with storage terf:temp args
data modify storage terf:temp args.teleport_duration set value 22
function terf:entity/machines/warp_core/visuals/summon_cube with storage terf:temp args
data modify storage terf:temp args.teleport_duration set value 23
function terf:entity/machines/warp_core/visuals/summon_cube with storage terf:temp args
data modify storage terf:temp args.teleport_duration set value 24
function terf:entity/machines/warp_core/visuals/summon_cube with storage terf:temp args
data modify storage terf:temp args.teleport_duration set value 25
function terf:entity/machines/warp_core/visuals/summon_cube with storage terf:temp args
data modify storage terf:temp args.teleport_duration set value 26
function terf:entity/machines/warp_core/visuals/summon_cube with storage terf:temp args

data modify storage terf:temp args2 set value {arg1:'tag @e[tag=terf_currententity] add terf_related_'}
data modify storage terf:temp args2.arg2 set from entity @s data.terf.machine_id
execute at @s run function datapipes_lib:require/with_args/2 with storage terf:temp args2
tag @e remove terf_currententity