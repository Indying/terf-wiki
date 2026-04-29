data modify storage terf:temp args set value {arg1:'execute as @e[type=minecraft:marker,tag=terf_neutron,distance=..128] at @s run particle minecraft:electric_spark ~ ~',arg3:' ~'}
data modify storage terf:temp args.arg2 set from entity @s SelectedItem.components.minecraft:custom_data.terf.monocular_offset
function datapipes_lib:require/with_args/3 with storage terf:temp args