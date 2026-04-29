playsound terf:explosion.pressuregigaboom master @a[distance=0..] ~ ~ ~ 10 1
playsound terf:explosion.pressuregigaboom master @a[distance=0..] ~ ~ ~ 10 1
playsound terf:explosion.pressuregigaboom master @a[distance=0..] ~ ~ ~ 10 0
playsound terf:explosion.pressuregigaboom master @a[distance=0..] ~ ~ ~ 10 0

particle minecraft:explosion_emitter ~ ~ ~ 1 1 1 0 20 force
particle minecraft:firework ~ ~ ~ 1 1 1 1 1000 force
particle minecraft:explosion ~ ~ ~ 0 0 0 10 6 force
summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_particle","terf_large_flash"],billboard:"center",text:{"text":"\ueef2"},background:0,view_range:16,brightness:{sky:15,block:15},alignment:center}

title @a[distance=..40] times 0 1 3
title @a[distance=..40] title "\ueff4"

effect give @a[distance=..35] minecraft:blindness 1 0 true

scoreboard players add @a[distance=..80] terf_data_P 60

execute as @a[distance=..20,tag=!terf_wearing_hazmat_suit] run damage @s 5 minecraft:explosion

execute as @e[type=text_display,tag=terf_shutdown_failure_glow,distance=..1] run data modify entity @s transformation.scale set value [.5f,.5f,.5f]
