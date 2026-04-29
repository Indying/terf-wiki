playsound minecraft:block.beacon.activate ambient @a[distance=0..] ~ ~ ~ 8 0
playsound minecraft:block.beacon.activate ambient @a[distance=0..] ~ ~ ~ 8 0
playsound minecraft:block.beacon.activate ambient @a[distance=0..] ~ ~ ~ 8 0
playsound minecraft:block.beacon.activate ambient @a[distance=0..] ~ ~ ~ 8 0
playsound minecraft:block.beacon.activate ambient @a[distance=0..] ~ ~ ~ 8 0
playsound minecraft:block.beacon.activate ambient @a[distance=0..] ~ ~ ~ 8 0
playsound minecraft:block.beacon.power_select ambient @a[distance=0..] ~ ~ ~ 8 0
playsound minecraft:block.beacon.ambient ambient @a[distance=0..] ~ ~ ~ 8 0
playsound minecraft:block.beacon.ambient ambient @a[distance=0..] ~ ~ ~ 8 0
playsound minecraft:block.beacon.ambient ambient @a[distance=0..] ~ ~ ~ 8 0
playsound minecraft:block.beacon.ambient ambient @a[distance=0..] ~ ~ ~ 8 0
particle minecraft:dust_color_transition{from_color:[0.3,0.0,0.0],to_color:[1,0,0],scale:4} ~ ~ ~ 0.5 0.5 0.5 1 1000 force
particle flash{color:[1,1,1,1]} ~ ~ ~ 0 0 0 0.08 10 force
particle minecraft:firework ~ ~ ~ 0 0 0 0.4 1000 force
advancement grant @a[distance=..32] only terf:stfr/stfr_startup
scoreboard players add @a[distance=..80] terf_data_P 30

execute if score startup_failure terf_states matches 1 run function terf:entity/machines/stfr/states/startup_overload/start
execute if score working_stabs terf_states matches 0 if score @s terf_data_A matches 2 run function terf:entity/machines/stfr/states/startup_overload/start

scoreboard players set startup_failure terf_states 0
execute if predicate datapipes_lib:chances/2 run scoreboard players set startup_failure terf_states 1

execute as @a[distance=..4] run advancement grant @s only terf:stfr/forbidden_microwave