tag @s remove terf_stfr_surge_unabortable

playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 20 0

playsound terf:charge_up.heavy_shutdown ambient @a[distance=0..] ~ ~ ~ 15 1
playsound terf:charge_up.heavy_shutdown ambient @a[distance=0..] ~ ~ ~ 15 1
playsound terf:charge_up.heavy_shutdown ambient @a[distance=0..] ~ ~ ~ 15 1
playsound terf:charge_up.heavy_shutdown ambient @a[distance=0..] ~ ~ ~ 15 1

scoreboard players set @s terf_data_A 3

scoreboard objectives remove terf_shake_magnitude
scoreboard objectives remove terf_shake_frequency
scoreboard objectives add terf_shake_magnitude dummy
scoreboard objectives add terf_shake_frequency dummy

scoreboard players add @a[distance=..80] terf_data_P 20

advancement grant @a[distance=..32] only terf:stfr/quick_thinking

function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.manual_restab.restabilize',level:1,text:'{"text":"The Fusion Reactor Core Has Been Restabilized Succesfully! "},{"text":"Please Shut Down The Fusion Reactor For Immediate Repairs","color":"gold"}'}