execute unless entity @s[tag=terf_broadcaston] run return fail
$scoreboard players set level terf_states $(level)
$execute if score level terf_states matches 0 run tellraw @a[distance=..128] [{"text":"["},{"text":"STFR:V3","color":"red"},{"text":"] "},{"text":"> "},$(text)]
$execute if score level terf_states matches 1 run tellraw @a[distance=..128] [{"text":"["},{"text":"STFR:V3","color":"red"},{"text":"] "},{"text":"!!!ATTENTION!!! ","color":"aqua"},{"text":"> "},$(text)]
$execute if score level terf_states matches 2 run tellraw @a[distance=..128] [{"text":"["},{"text":"STFR:V3","color":"red"},{"text":"] "},{"text":"!!!WARNING!!! ","color":"red"},{"text":"> "},$(text)]
$execute if score level terf_states matches 3 run tellraw @a[distance=..128] [{"text":"["},{"text":"STFR:V3","color":"red"},{"text":"] "},{"text":"!⚠DANGER⚠! ","color":"dark_red"},{"text":"> "},$(text)]
$execute if score level terf_states matches 4 run tellraw @a[distance=..128] [{"text":"["},{"text":"STFR:V3","color":"red"},{"text":"] "},{"text":"⚠⚠EXTREME DANGER⚠⚠ ","color":"dark_red"},{"text":"> "},$(text)]
$execute if score level terf_states matches 5 run tellraw @a[distance=..128] [{"text":"["},{"text":"STFR:V3","color":"red"},{"text":"] "},{"text":"ERROR: ","color":"dark_red"},$(text)]

execute if score level terf_states matches 1 run playsound terf:alarms.notification ambient @a[distance=0..] ~ ~ ~ 8 1
execute if score level terf_states matches 2 run playsound terf:alarms.notification ambient @a[distance=0..] ~ ~ ~ 8 1.5
execute if score level terf_states matches 3 run playsound terf:alarms.notification ambient @a[distance=0..] ~ ~ ~ 8 1.6
execute if score level terf_states matches 3 run playsound terf:alarms.notification ambient @a[distance=0..] ~ ~ ~ 8 1.7
execute if score level terf_states matches 4 run playsound terf:alarms.notification ambient @a[distance=0..] ~ ~ ~ 8 2
execute if score level terf_states matches 5 run playsound terf:alarms.notification ambient @a[distance=0..] ~ ~ ~ 8 2
execute if score level terf_states matches 5 run playsound terf:alarms.notification ambient @a[distance=0..] ~ ~ ~ 8 1.5

stopsound @a[distance=..128] voice
$playsound terf:voicelines.$(voiceline) voice @a[distance=0..] ~ ~ ~ 8 0.9
$playsound terf:voicelines.$(voiceline) voice @a[distance=0..] ~ ~ ~ 8 0.9
$playsound terf:voicelines.$(voiceline) voice @a[distance=0..] ~ ~ ~ 8 0.9

scoreboard players add @s terf_data_Ae 10
execute if score @s terf_data_Ae matches 300.. run function terf:entity/machines/mainframe/crash_connected_mainframe

$function terf:require/discord_integration/start {prefix:"**:stfrcube: [STFR]**  » ",text_components:[$(text)]}

$$(bcd)
