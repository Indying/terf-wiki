data modify entity @s data.terf.stored_item set from storage terf:temp item
data modify entity @s data.terf.stored_recipe set from storage terf:temp output

execute store result score @s datapipes_lib_power_max run data get storage terf:temp output.x 100

playsound terf:opencore.lock_material master @a[distance=0..] ~ ~ ~ 1 1.2

kill @e[type=item,tag=terf_currententity]

data modify storage terf:temp args set value {arg1:"execute as @e[tag=terf_related_",arg3:"] run data modify entity @s item set from storage terf:temp item"}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/3 with storage terf:temp args

function terf:entity/machines/opencore/broadcast {level:0,text:'{"text":"Material Locked!","color":"aqua"}'}

tag @s add terf_oc_loading