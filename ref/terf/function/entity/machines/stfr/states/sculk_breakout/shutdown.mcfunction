playsound terf:charge_up.heavy_shutdown master @a[distance=0..] ~ ~ ~ 10 1
playsound terf:charge_up.heavy_shutdown master @a[distance=0..] ~ ~ ~ 10 1
playsound terf:charge_up.heavy_shutdown master @a[distance=0..] ~ ~ ~ 10 1
playsound terf:charge_up.heavy_shutdown master @a[distance=0..] ~ ~ ~ 10 1
playsound terf:charge_up.heavy_shutdown master @a[distance=0..] ~ ~ ~ 10 1
playsound terf:charge_up.heavy_shutdown master @a[distance=0..] ~ ~ ~ 10 1

effect give @a[distance=..35] minecraft:blindness 1 0 true
scoreboard players add @a[distance=..80] terf_data_P 60
tag @s remove terf_core_online

playsound terf:explosion.shieldboom ambient @a[distance=0..] ~ ~ ~ 24 1
playsound terf:explosion.shieldboom ambient @a[distance=0..] ~ ~ ~ 24 1
playsound terf:explosion.shieldboom ambient @a[distance=0..] ~ ~ ~ 24 1
playsound terf:explosion.pressuregigaboom master @a[distance=0..] ~ ~ ~ 10 2
particle minecraft:explosion_emitter ~ ~ ~ 1 1 1 0 20 force
particle minecraft:firework ~ ~ ~ 4 4 4 1 1000 force
particle minecraft:end_rod ~ ~ ~ 1 1 1 0.5 1000 force

function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:5,text:'{"text":"An Unexpected Error Has Occoured!","color":"red"}'}