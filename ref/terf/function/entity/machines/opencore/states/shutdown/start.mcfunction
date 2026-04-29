$execute at @s positioned ~ ~4 ~ run fill ~ ~-1 ~ ~1 ~$(height) ~1 minecraft:light
scoreboard players set @s terf_data_D 5
scoreboard players set @s terf_data_E 0
scoreboard players set @s datapipes_lib_power_storage 0
scoreboard players set @s datapipes_lib_power_max 0

data remove entity @s data.terf.stored_item
data modify storage terf:temp args set value {arg1:"kill @e[tag=terf_related_",arg3:"]"}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/3 with storage terf:temp args

stopsound @a[distance=..256] * terf:music.dimrain47_every_end
stopsound @a[distance=..256] * terf:music.dimrain47_every_end_remix

execute at @s run playsound terf:charge_up.mega_chargedown ambient @a[distance=0..] ~ ~ ~ 6 1
execute at @s run playsound terf:charge_up.mega_chargedown ambient @a[distance=0..] ~ ~ ~ 6 1
playsound terf:spotlight2 ambient @a[distance=0..] ~ ~ ~ 2 0.9
execute at @s run playsound terf:switch ambient @a[distance=0..] ~ ~ ~ 2 0
execute at @s run playsound terf:lightsswitch ambient @a[distance=0..] ~ ~ ~ 2 2

advancement grant @p[distance=..10] only terf:opencore/opencore_complete
function terf:entity/machines/opencore/broadcast {level:1,text:'{"text":"OpenCore Shutting Down... ","color":"aqua"},{"text":"Collecting Reactor Core Contents...","color":"dark_aqua"}'}
