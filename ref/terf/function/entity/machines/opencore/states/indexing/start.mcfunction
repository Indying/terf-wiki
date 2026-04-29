scoreboard players set @s terf_data_E 0
scoreboard players set @s terf_data_D 2
scoreboard players set @s datapipes_lib_power_max 1000

playsound terf:opencore.voice_powerup master @a[distance=0..] ~ ~ ~ 6
execute at @s run playsound terf:opencore.magnet_start master @a[distance=0..] ~ ~ ~ 1
function terf:entity/machines/opencore/broadcast {level:1,text:'{"text":"OpenCore Electromagnet Powerup Sequence Initiated! ","color":"aqua"},{"text":"Please Stay Away From Nearby Electrical Conductors!","color":"dark_aqua"}'}

data modify storage terf:temp args set value {arg1:'execute positioned ~ ~4 ~ run summon minecraft:item_display ~.5 ~',arg3:' ~.5 {Tags:["terf_related_',arg5:'"]}'}
data modify storage terf:temp args.arg2 set from entity @s data.terf.opencore.half_height
data modify storage terf:temp args.arg4 set from entity @s data.terf.machine_id
execute at @s run function datapipes_lib:require/with_args/5 with storage terf:temp args
