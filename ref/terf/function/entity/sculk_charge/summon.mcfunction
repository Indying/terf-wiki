data modify storage terf:temp args set value {arg1:'execute align xyz run summon minecraft:marker ~.5 ~.5 ~.5 {Tags:["terf_sculk_charge","terf_related_',arg3:'"],data:{terf:{machine_id:',arg5:'}}}'}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
data modify storage terf:temp args.arg4 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/5 with storage terf:temp args

execute if predicate datapipes_lib:chances/0.05 run scoreboard players set @e[type=minecraft:marker,tag=terf_sculk_charge,distance=..2] terf_data_A -1000