$execute positioned ~ ~4 ~ run fill ~ ~-1 ~ ~1 ~$(height) ~1 minecraft:air

stopsound @a[distance=..256] * terf:opencore.unstable
scoreboard players set @s terf_data_G 22
scoreboard players set @s terf_data_E 0
scoreboard players set @s terf_data_D 0
scoreboard players set @s terf_data_I 0
scoreboard players set @s datapipes_lib_power_max 0
scoreboard players set @s datapipes_lib_power_storage 0

data modify storage terf:temp oc_args.array set from entity @s data.terf.stored_recipe.fail
$execute positioned ~ ~4 ~ positioned ~.5 ~$(half_height) ~.5 run function terf:entity/machines/opencore/states/meltdown/run_dangers
data remove entity @s data.terf.stored_recipe
data remove entity @s data.terf.stored_item

data modify storage terf:temp args set value {arg1:"kill @e[tag=terf_related_",arg3:"]"}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/3 with storage terf:temp args
