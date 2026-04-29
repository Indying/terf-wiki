playsound minecraft:block.beacon.deactivate ambient @a[distance=0..] ~ ~ ~ 10 2
playsound minecraft:block.beacon.deactivate ambient @a[distance=0..] ~ ~ ~ 10 2
playsound minecraft:block.beacon.deactivate ambient @a[distance=0..] ~ ~ ~ 10 2
playsound minecraft:block.beacon.deactivate ambient @a[distance=0..] ~ ~ ~ 10 2
playsound minecraft:block.beacon.deactivate ambient @a[distance=0..] ~ ~ ~ 10 2
playsound minecraft:block.beacon.deactivate ambient @a[distance=0..] ~ ~ ~ 10 1.9
playsound minecraft:block.beacon.deactivate ambient @a[distance=0..] ~ ~ ~ 10 1.8
playsound minecraft:block.beacon.deactivate ambient @a[distance=0..] ~ ~ ~ 10 1.7
playsound minecraft:block.beacon.deactivate ambient @a[distance=0..] ~ ~ ~ 10 1.6
playsound minecraft:block.beacon.deactivate ambient @a[distance=0..] ~ ~ ~ 10 1.5
playsound minecraft:block.beacon.deactivate ambient @a[distance=0..] ~ ~ ~ 10 1.4
playsound minecraft:block.beacon.deactivate ambient @a[distance=0..] ~ ~ ~ 10 1.3
playsound minecraft:block.beacon.deactivate ambient @a[distance=0..] ~ ~ ~ 10 1.2
playsound minecraft:block.beacon.deactivate ambient @a[distance=0..] ~ ~ ~ 10 1.1
playsound minecraft:block.beacon.deactivate ambient @a[distance=0..] ~ ~ ~ 10 1
playsound minecraft:block.beacon.deactivate ambient @a[distance=0..] ~ ~ ~ 10 0.9
playsound minecraft:block.beacon.deactivate ambient @a[distance=0..] ~ ~ ~ 10 0.8
playsound minecraft:block.beacon.deactivate ambient @a[distance=0..] ~ ~ ~ 10 0.7
playsound minecraft:block.beacon.deactivate ambient @a[distance=0..] ~ ~ ~ 10 0.6
playsound minecraft:block.beacon.deactivate ambient @a[distance=0..] ~ ~ ~ 10 0.5
playsound minecraft:block.beacon.deactivate ambient @a[distance=0..] ~ ~ ~ 10 0.4
playsound minecraft:block.beacon.deactivate ambient @a[distance=0..] ~ ~ ~ 10 0.3
playsound minecraft:block.beacon.deactivate ambient @a[distance=0..] ~ ~ ~ 10 0.2
playsound minecraft:block.beacon.deactivate ambient @a[distance=0..] ~ ~ ~ 10 0.1
playsound minecraft:block.beacon.deactivate ambient @a[distance=0..] ~ ~ ~ 10 0
stopsound @a * terf:music.bgmusic2
kill @e[type=minecraft:end_crystal,distance=..3]

particle minecraft:end_rod ~ ~ ~ 1 1 1 0 1000 force
particle minecraft:end_rod ~ ~ ~ 1 1 1 3 1000 force
particle minecraft:end_rod ~ ~ ~ 1 1 1 1 1000 force
particle minecraft:firework ~ ~ ~ 1 1 1 1 1000 force
playsound terf:explosion.shieldboom ambient @a[distance=0..] ~ ~ ~ 24 1

scoreboard players set @s terf_data_A 5
scoreboard players set @s terf_data_E 90

scoreboard players add @a[distance=..80] terf_data_P 30

function terf:entity/machines/stfr/states/overload/summon_red_text_displays

playsound terf:music.hacknet_ost_panic_track ui @a[tag=!terf_disable_music] ~ ~ ~ 15 1.02
execute as @a[distance=..256] run function terf:entity/player/title_music {music:"Hacknet OST: Remi Gallego - Panic Track"}

function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.stasis.fail',level:3,text:'{"text":"Reactor Restabilization Failure! Please Evacuate The Facility Immediately!","color":"red"}'}