$scoreboard players set level terf_states $(level)
$execute if score level terf_states matches 0 as @s[tag=terf_broadcaston] run tellraw @a[distance=..128] ["",{"text":"["},{"text":"OpenCore","color":"blue"},{"text":"] "},{"text":"> "},$(text)]
$execute if score level terf_states matches 1 as @s[tag=terf_broadcaston] run tellraw @a[distance=..128] ["",{"text":"["},{"text":"OpenCore","color":"blue"},{"text":"] "},{"text":"!!!ATTENTION!!! ","color":"aqua"},{"text":"> "},$(text)]
$execute if score level terf_states matches 2 as @s[tag=terf_broadcaston] run tellraw @a[distance=..128] ["",{"text":"["},{"text":"OpenCore","color":"blue"},{"text":"] "},{"text":"!!!WARNING!!! ","color":"red"},{"text":"> "},$(text)]
$execute if score level terf_states matches 3 as @s[tag=terf_broadcaston] run tellraw @a[distance=..128] ["",{"text":"["},{"text":"OpenCore","color":"blue"},{"text":"] "},{"text":"!⚠DANGER⚠! ","color":"dark_red"},{"text":"> "},$(text)]
$execute if score level terf_states matches 4 as @s[tag=terf_broadcaston] run tellraw @a[distance=..128] ["",{"text":"["},{"text":"OpenCore","color":"blue"},{"text":"] "},{"text":"⚠⚠EXTREME DANGER⚠⚠ ","color":"dark_red"},{"text":"> "},$(text)]

execute if score level terf_states matches 1 as @s[tag=terf_broadcaston] run playsound terf:alarms.notification master @a[distance=0..] ~ ~ ~ 8 1
execute if score level terf_states matches 2 as @s[tag=terf_broadcaston] run playsound terf:alarms.notification master @a[distance=0..] ~ ~ ~ 8 1.5
execute if score level terf_states matches 3 as @s[tag=terf_broadcaston] run playsound terf:alarms.notification master @a[distance=0..] ~ ~ ~ 8 1.6
execute if score level terf_states matches 3 as @s[tag=terf_broadcaston] run playsound terf:alarms.notification master @a[distance=0..] ~ ~ ~ 8 1.7
execute if score level terf_states matches 4 as @s[tag=terf_broadcaston] run playsound terf:alarms.notification master @a[distance=0..] ~ ~ ~ 8 2








