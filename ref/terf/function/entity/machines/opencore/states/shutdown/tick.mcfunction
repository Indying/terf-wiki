scoreboard players add @s terf_data_E 1

fill ~ ~3 ~ ~1 ~8 ~1 minecraft:air

particle minecraft:electric_spark ~.5 ~6 ~.5 0.1 0.1 0.1 0 10 force
particle minecraft:firework ~.5 ~6 ~.5 0 0 0 0.1 1 force
particle minecraft:end_rod ~.5 ~6 ~.5 0 0.4 0 1 0 force
particle minecraft:end_rod ~.5 ~6 ~.5 0 -0.4 0 1 0 force

scoreboard players set @s terf_data_D 5
data remove entity @s data.terf.stored_item
data modify storage terf:temp args set value {arg1:"kill @e[tag=terf_related_",arg3:"]"}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/3 with storage terf:temp args

execute if score @s terf_data_G matches 23.. run scoreboard players remove @s terf_data_G 1
execute if score @s terf_data_G matches ..21 run scoreboard players add @s terf_data_G 1

#player damage
execute positioned ~ ~3 ~ run damage @a[distance=..3,limit=1,sort=random] 8 terf:reactor

execute if score @s terf_data_E matches 250.. run function terf:entity/machines/opencore/states/shutdown/complete with entity @s data.terf.stored_recipe