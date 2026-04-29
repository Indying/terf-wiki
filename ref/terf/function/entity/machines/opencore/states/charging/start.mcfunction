scoreboard players set @s terf_data_E 1
scoreboard players set @s terf_data_D 3
scoreboard players set @s terf_data_I 0
playsound terf:opencore.voice_startup master @a[distance=0..] ~ ~ ~ 6 1
playsound terf:alarms.beep master @a[distance=0..] ~ ~ ~ 1 0.7

execute unless score secret_opencore_music terf_states matches ..1 run playsound terf:music.dimrain47_every_end ui @a[distance=..128,tag=!terf_disable_music] ~ ~10000000000 ~ 10000000000 1
execute unless score secret_opencore_music terf_states matches ..1 as @a[distance=..128] run function terf:entity/player/title_music {music:"Dimrain47: Every End"}

execute if score secret_opencore_music terf_states matches ..1 run playsound terf:music.dimrain47_every_end_remix ui @a[distance=..128,tag=!terf_disable_music] ~ ~10000000000 ~ 10000000000 1
execute if score secret_opencore_music terf_states matches ..1 run function terf:entity/player/title_music {music:"Dimrain47: Every End Remix"}

execute store result score secret_opencore_music terf_states run random value 1..50

execute at @s run playsound terf:charge_up.mega_chargeup master @a[distance=0..] ~ ~ ~ 8 1
execute at @s run playsound terf:charge_up.mega_chargeup master @a[distance=0..] ~ ~ ~ 8 1
execute at @s run playsound terf:charge_up.mega_chargeup master @a[distance=0..] ~ ~ ~ 8 1
execute at @s run playsound terf:charge_up.mega_chargeup master @a[distance=0..] ~ ~ ~ 8 1

advancement grant @a[distance=..10] only terf:opencore/opencore_startup
function terf:entity/machines/opencore/broadcast {level:1,text:'{"text":"OpenCore Powerup Sequence Authorized and Confirmed! ","color":"aqua"},{"text":"Charging Positron Emission Units...","color":"dark_aqua"}'}

data modify storage terf:temp args set value {arg1:'execute positioned ~ ~4 ~ run summon minecraft:text_display ~.5 ~',arg3:' ~.5 {Tags:["terf_related_',arg5:'"],billboard:"center",alignment:center,background:0,brightness:{sky:15,block:15},text:{"text":"\\ueef0"}}'}
data modify storage terf:temp args.arg2 set from entity @s data.terf.opencore.half_height
data modify storage terf:temp args.arg4 set from entity @s data.terf.machine_id
execute at @s run function datapipes_lib:require/with_args/5 with storage terf:temp args

kill @e[type=item,distance=..1]