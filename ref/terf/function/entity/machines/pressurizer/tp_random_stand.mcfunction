$execute store result score temp terf_states run data get storage terf:constants pressurizer_storage.$(machine_id)

data modify storage terf:temp args.arg1 set value 'execute store result score temp terf_states run random value 0..'
execute store result storage terf:temp args.arg2 int 1 run scoreboard players get temp terf_states
function datapipes_lib:require/with_args/2 with storage terf:temp args

$data modify storage terf:temp args set value {arg1:'data modify storage terf:temp args.array set from storage terf:constants pressurizer_storage.$(machine_id)[',arg3:']'}
execute store result storage terf:temp args.arg2 int 1 run scoreboard players get temp terf_states
function datapipes_lib:require/with_args/3 with storage terf:temp args

data modify storage terf:temp args.x set from storage terf:temp args.array[0]
data modify storage terf:temp args.y set from storage terf:temp args.array[1]
data modify storage terf:temp args.z set from storage terf:temp args.array[2]
$execute as @e[type=minecraft:armor_stand,tag=terf_gas_oxygen,tag=terf_related_$(machine_id),limit=1,sort=random] run function terf:entity/machines/pressurizer/stand/teleport_random_args with storage terf:temp args