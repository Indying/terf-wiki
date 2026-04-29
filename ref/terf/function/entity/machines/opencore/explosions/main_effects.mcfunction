execute as @a[distance=..60] at @s run function terf:require/ceiling_dust/start
scoreboard players add @a[distance=..60] terf_data_P 30
playsound terf:explosion.missile master @a[distance=0..] ~ ~ ~ 8 0
playsound terf:explosion.missile master @a[distance=0..] ~ ~ ~ 8 0

particle minecraft:lava ~ ~ ~ 3 3 3 1 1000 force
particle minecraft:flame ~ ~ ~ 0.2 0.2 0.2 0.7 600 force
particle minecraft:campfire_cosy_smoke ~ ~ ~ 0.2 0.2 0.2 0.2 600 force
summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_particle","terf_small_flash"],billboard:"center",text:{"text":"\ueef2"},background:0,view_range:32,brightness:{sky:15,block:15},alignment:center}

function terf:entity/machines/mainframe/crash_connected_mainframe