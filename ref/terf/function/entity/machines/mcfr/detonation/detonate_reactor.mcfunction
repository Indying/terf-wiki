playsound terf:explosion.huge_explosion master @a[distance=0..] ~ ~ ~ 15 1
playsound terf:explosion.mega_explosion master @a[distance=0..] ~ ~ ~ 10 1
playsound terf:explosion.huge_explosion master @a[distance=0..] ~ ~ ~ 15 1
playsound terf:explosion.mega_explosion master @a[distance=0..] ~ ~ ~ 10 1
playsound terf:explosion.huge_explosion master @a[distance=0..] ~ ~ ~ 15 1
playsound terf:explosion.mega_explosion master @a[distance=0..] ~ ~ ~ 10 0
playsound terf:explosion.mega_explosion master @a[distance=0..] ~ ~ ~ 10 0
kill @e[tag=terf_particle]
playsound terf:explosion.pressuregigaboom master @a[distance=0..] ~ ~ ~ 10 0
playsound terf:explosion.thunder master @a[distance=0..] ~ ~ ~ 20 0
playsound terf:explosion.thunder master @a[distance=0..] ~ ~ ~ 20 0.1
playsound terf:explosion.thunder master @a[distance=0..] ~ ~ ~ 20 0.2
playsound terf:explosion.thunder master @a[distance=0..] ~ ~ ~ 20 0.3
playsound terf:explosion.thunder master @a[distance=0..] ~ ~ ~ 20 0.4
playsound terf:explosion.thunder master @a[distance=0..] ~ ~ ~ 20 0.5
playsound terf:explosion.thunder master @a[distance=0..] ~ ~ ~ 20 0.6
playsound terf:explosion.thunder master @a[distance=0..] ~ ~ ~ 20 0.7
playsound terf:explosion.thunder master @a[distance=0..] ~ ~ ~ 20 0.8

summon minecraft:lightning_bolt ~ ~1000000 ~
summon minecraft:lightning_bolt ~ ~1000000 ~
summon minecraft:lightning_bolt ~ ~1000000 ~

scoreboard players set terminated terf_states 2000
function terf:entity/machines/mcfr/detonation/raycast_start_iterate

scoreboard players set @s terf_data_C 0
scoreboard players set height terf_states 1
execute positioned ~.499 ~ ~.499 run function terf:entity/machines/mcfr/detonation/at_all_segments

execute positioned ~.5 ~ ~.5 run function terf:require/run_n_times {n:2000,command:'function terf:entity/particle/spark/summon'}
summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_particle","terf_light_beam"],billboard:"vertical",text:{"text":"\ueef4"},background:0,view_range:20,brightness:{sky:15,block:15},alignment:center,transformation:{scale:[1f,1f,1f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,-.1]}}
summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_particle","terf_light_beam"],billboard:"vertical",text:{"text":"\ueedf"},background:0,view_range:20,brightness:{sky:15,block:15},alignment:center}

summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_particle","terf_large_flash"],billboard:"center",text:{"text":"\ueef2"},background:0,view_range:16,brightness:{sky:15,block:15},alignment:center}

function terf:entity/machines/multiblock_core_kill

#give screenshake
scoreboard players add @a[distance=..10] terf_data_P 5
scoreboard players add @a[distance=..20] terf_data_P 5
scoreboard players add @a[distance=..30] terf_data_P 5
scoreboard players add @a[distance=..40] terf_data_P 5
scoreboard players add @a[distance=..50] terf_data_P 5
scoreboard players add @a[distance=..60] terf_data_P 5
scoreboard players add @a[distance=..70] terf_data_P 5
scoreboard players add @a[distance=..80] terf_data_P 5
scoreboard players add @a[distance=..90] terf_data_P 5
scoreboard players add @a[distance=..100] terf_data_P 5
scoreboard players add @a[distance=..110] terf_data_P 5
scoreboard players add @a[distance=..120] terf_data_P 5
scoreboard players add @a[distance=..130] terf_data_P 5
scoreboard players add @a[distance=..140] terf_data_P 5
scoreboard players add @a[distance=..150] terf_data_P 5
scoreboard players add @a[distance=..160] terf_data_P 5
scoreboard players add @a[distance=..170] terf_data_P 5
scoreboard players add @a[distance=..180] terf_data_P 5
scoreboard players add @a[distance=..190] terf_data_P 5
scoreboard players add @a[distance=..200] terf_data_P 5

#give advancement
advancement grant @a[distance=..256] only terf:mcfr/mcfr_meltdown

#give radiation
scoreboard players add @a[distance=..10] terf_data_A 3124
scoreboard players add @a[distance=..20] terf_data_A 3124
scoreboard players add @a[distance=..30] terf_data_A 3124
scoreboard players add @a[distance=..40] terf_data_A 3124
scoreboard players add @a[distance=..50] terf_data_A 3124
scoreboard players add @a[distance=..60] terf_data_A 3124
scoreboard players add @a[distance=..70] terf_data_A 3124
scoreboard players add @a[distance=..80] terf_data_A 3124
scoreboard players add @a[distance=..90] terf_data_A 3124
scoreboard players add @a[distance=..100] terf_data_A 3124
scoreboard players add @a[distance=..110] terf_data_A 3124
scoreboard players add @a[distance=..120] terf_data_A 3124
scoreboard players add @a[distance=..130] terf_data_A 3124
scoreboard players add @a[distance=..140] terf_data_A 3124
scoreboard players add @a[distance=..150] terf_data_A 3124
scoreboard players add @a[distance=..160] terf_data_A 3124
scoreboard players add @a[distance=..170] terf_data_A 3124
scoreboard players add @a[distance=..180] terf_data_A 3124
scoreboard players add @a[distance=..190] terf_data_A 3124
scoreboard players add @a[distance=..200] terf_data_A 3124
scoreboard players add @a[distance=..210] terf_data_A 3124
scoreboard players add @a[distance=..220] terf_data_A 3124
scoreboard players add @a[distance=..230] terf_data_A 3124
scoreboard players add @a[distance=..240] terf_data_A 3124
scoreboard players add @a[distance=..250] terf_data_A 3124
scoreboard players add @a[distance=..260] terf_data_A 3124
scoreboard players add @a[distance=..270] terf_data_A 3124
scoreboard players add @a[distance=..280] terf_data_A 3124
scoreboard players add @a[distance=..290] terf_data_A 3124
