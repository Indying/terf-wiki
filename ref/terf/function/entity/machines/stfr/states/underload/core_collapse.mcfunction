scoreboard players set @a[distance=..80] terf_shake_frequency 5
scoreboard players set @a[distance=..80] terf_shake_magnitude 8

stopsound @a[distance=..128] * minecraft:block.bell.resonate
function terf:entity/machines/stfr/case_blowout
title @a[distance=..40] times 0 1 4
title @a[distance=..40] title "\ueff4"

execute as @a[distance=..60] at @s run function terf:require/ceiling_dust/start
stopsound @a[distance=..256] * terf:music.hacknet_ost_malware_injection_remix

execute as @a[distance=..256] run damage @s 0.00001 terf:shockwave at ~ ~ ~
execute as @a[distance=..256] run damage @s 0.00001 terf:shockwave at ~ ~ ~
execute as @a[distance=..256] run damage @s 0.00001 terf:shockwave at ~ ~ ~
execute as @a[distance=..256] run damage @s 0.00001 terf:shockwave at ~ ~ ~
execute as @a[distance=..256] run damage @s 0.00001 terf:shockwave at ~ ~ ~
execute as @a[distance=..256] run damage @s 0.00001 terf:shockwave at ~ ~ ~
execute as @a[distance=..256] run damage @s 0.00001 terf:shockwave at ~ ~ ~
execute as @a[distance=..256] run damage @s 0.00001 terf:shockwave at ~ ~ ~
execute as @a[distance=..256] run damage @s 0.00001 terf:shockwave at ~ ~ ~
execute as @a[distance=..256] run damage @s 0.00001 terf:shockwave at ~ ~ ~
execute as @a[distance=..256] run damage @s 0.00001 terf:shockwave at ~ ~ ~
execute as @a[distance=..256] run damage @s 0.00001 terf:shockwave at ~ ~ ~
execute as @a[distance=..256] run damage @s 0.00001 terf:shockwave at ~ ~ ~
execute as @a[distance=..256] run damage @s 0.00001 terf:shockwave at ~ ~ ~
execute as @a[distance=..256] run damage @s 0.00001 terf:shockwave at ~ ~ ~
execute as @a[distance=..256] run damage @s 0.00001 terf:shockwave at ~ ~ ~
execute as @a[distance=..256] run damage @s 0.00001 terf:shockwave at ~ ~ ~
execute as @a[distance=..256] run damage @s 0.00001 terf:shockwave at ~ ~ ~

scoreboard players set @s terf_data_E 0
scoreboard players set @s terf_data_A 13

tag @s remove terf_core_online
effect give @a[distance=..35] minecraft:blindness 1 0 true

playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 100 0.7
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 100 0.7
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 100 0.7
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 100 0.7
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 100 0.7
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 100 0.7
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 100 0.7
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 100 0.7
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 100 0.7
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 100 0.7
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 100 0.7
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 100 0.7
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 100 0.7
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 100 0.7
