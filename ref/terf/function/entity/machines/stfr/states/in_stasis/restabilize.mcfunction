playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
kill @e[type=minecraft:end_crystal,distance=..3]

scoreboard players set @s terf_data_A 3

tag @s remove terf_manual_stabilization_failed

scoreboard objectives remove terf_shake_magnitude
scoreboard objectives remove terf_shake_frequency
scoreboard objectives add terf_shake_magnitude dummy
scoreboard objectives add terf_shake_frequency dummy

scoreboard players add @a[distance=..80] terf_data_P 20

function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.stasis.success',level:1,text:'{"text":"The Fusion Reactor Core Has Been Restabilized Succesfully! "},{"text":"Please Shut Down The Fusion Reactor For Immediate Repairs","color":"gold"}'}