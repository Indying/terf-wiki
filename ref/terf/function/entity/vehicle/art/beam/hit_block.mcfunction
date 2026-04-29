scoreboard players remove terminated terf_states 20
execute if block ~ ~ ~ minecraft:obsidian run scoreboard players set terminated terf_states -1

playsound terf:explosion.explosion_rumble ambient @a[distance=0..] ~ ~ ~ 8 2
playsound terf:explosion.explosion_rumble ambient @a[distance=0..] ~ ~ ~ 8 2
playsound terf:explosion.explosion_far2 ambient @a[distance=0..] ~ ~ ~ 8 0
scoreboard players add @a[distance=..256] terf_data_P 2

execute if block ~ ~ ~ #terf:indestructible run return run scoreboard players set terminated terf_states -1
setblock ~ ~ ~ air destroy

execute if score terminated terf_states matches 1.. run return fail
summon tnt ~ ~ ~ {fuse:0}
summon minecraft:text_display ^ ^ ^-0.2 {Tags:["terf_random_vel","terf_particle","terf_small_flash"],billboard:"center",text:{"text":"\ueef2"},background:0,view_range:32,brightness:{sky:15,block:15},alignment:center}
summon minecraft:text_display ^ ^ ^-0.1 {Tags:["terf_random_vel","terf_particle","terf_large_flash"],billboard:"center",text:{"text":"\ueef2"},background:0,view_range:16,brightness:{sky:15,block:15},alignment:center}
particle minecraft:explosion ~ ~ ~ 0 0 0 10 10 force