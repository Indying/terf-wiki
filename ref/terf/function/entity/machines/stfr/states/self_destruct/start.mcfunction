playsound terf:music.the_final_flash_of_existance_remix ui @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 16 1
execute if score @s terf_data_A matches 0 run scoreboard players set @s terf_data_M 16000000
execute if score @s terf_data_A matches 0 run tag @s add terf_stfr_offline
scoreboard players set @s terf_data_A 15
scoreboard players set @s terf_data_E 0
execute as @s[tag=terf_speakerconnected] run playsound terf:alarms.beep2 master @a[distance=0..] ~ ~ ~ 1 0.6
execute as @s[tag=terf_speakerconnected] run playsound terf:alarms.beep2 master @a[distance=0..] ~ ~ ~ 1 0.64
execute as @s[tag=terf_speakerconnected] run playsound terf:alarms.beep2 master @a[distance=0..] ~ ~ ~ 1 0