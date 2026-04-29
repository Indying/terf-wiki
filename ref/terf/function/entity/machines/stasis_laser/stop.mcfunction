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
scoreboard players add @a[distance=..80] terf_data_P 30
scoreboard players set @s terf_data_A 0

scoreboard objectives remove terf_shake_frequency
scoreboard objectives remove terf_shake_magnitude
scoreboard objectives add terf_shake_frequency dummy
scoreboard objectives add terf_shake_magnitude dummy

$kill @e[tag=terf_related_$(machine_id)]

execute positioned ^-1 ^ ^ run function datapipes_lib:require/lightning_rod_off
execute positioned ^ ^-1 ^ run function datapipes_lib:require/lightning_rod_off
execute positioned ^ ^ ^-1 run function datapipes_lib:require/lightning_rod_off
execute positioned ^ ^1 ^ run function datapipes_lib:require/lightning_rod_off
