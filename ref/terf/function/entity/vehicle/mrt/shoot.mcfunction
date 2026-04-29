data merge entity @s {interpolation_duration:1,start_interpolation:0,transformation:{translation:[0f,0f,-.5f]}}
scoreboard players set @s terf_data_B 5
scoreboard players remove @s terf_data_A 1

scoreboard players operation bullets_exists terf_states = photon_beam_last terf_states

#get the current rotation for flexibility
summon marker ^ ^ ^ {UUID:[I;1101100,1101101,1100001,1101111]}
rotate 0010cd2c-0010-cd2d-0010-c8e10010cd37 ~ ~
execute store result score yaw terf_states run data get entity 0010cd2c-0010-cd2d-0010-c8e10010cd37 Rotation[0] 1000
execute store result score pitch terf_states run data get entity 0010cd2c-0010-cd2d-0010-c8e10010cd37 Rotation[1] 1000
kill 0010cd2c-0010-cd2d-0010-c8e10010cd37

scoreboard players set length terf_states 0
scoreboard players operation terminated terf_states = photon_beam_speed terf_states

tag @s add terf_currententity
function terf:entity/vehicle/mrt/beam/step with storage terf:temp args
tag @s remove terf_currententity

playsound terf:explosion.bang2 master @a[distance=0..] ~ ~ ~ 1 2
playsound terf:explosion.bang2 master @a[distance=0..] ~ ~ ~ 2 1.9
playsound terf:explosion.bang2 master @a[distance=0..] ~ ~ ~ 2.4 1.8
playsound terf:explosion.bang2 master @a[distance=0..] ~ ~ ~ 2.8 1.7
playsound terf:explosion.bang2 master @a[distance=0..] ~ ~ ~ 3.4 1.6
playsound terf:explosion.bang2 master @a[distance=0..] ~ ~ ~ 4.1 1.5
playsound terf:explosion.bang2 master @a[distance=0..] ~ ~ ~ 4.9 1.4
playsound terf:explosion.bang2 master @a[distance=0..] ~ ~ ~ 5.9 1.3
playsound terf:explosion.bang2 master @a[distance=0..] ~ ~ ~ 7.1 1.2
playsound terf:explosion.bang2 master @a[distance=0..] ~ ~ ~ 8.6 1.1
playsound terf:explosion.bang2 master @a[distance=0..] ~ ~ ~ 10.3 1
playsound terf:explosion.bang2 master @a[distance=0..] ~ ~ ~ 12.3 .9
playsound terf:explosion.bang2 master @a[distance=0..] ~ ~ ~ 14.8 .8
playsound terf:explosion.bang2 master @a[distance=0..] ~ ~ ~ 17.8 .7
playsound terf:explosion.bang2 master @a[distance=0..] ~ ~ ~ 21.3 .6
playsound terf:explosion.bang2 master @a[distance=0..] ~ ~ ~ 25.6 .5

scoreboard players set terminated terf_states 100
function terf:entity/vehicle/mrt/beam/random_particle

particle flash{color:[1,1,1,1]} ~ ~ ~ 0 0 0 0 1 force
scoreboard players set @a[distance=..5] terf_data_P 15