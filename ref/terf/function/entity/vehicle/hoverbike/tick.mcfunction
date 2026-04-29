#terf_data_A = height
#terf_data_B = damage
#datapipes_lib_power_storage = charge

#terf_data_X = X velocity
#terf_data_Y = Y velocity
#terf_data_Z = Z velocity

## Damage effects
scoreboard players operation damage terf_states = @s terf_data_B
scoreboard players operation damage terf_states /= 20000 terf_states
execute if score damage terf_states matches 100.. if predicate datapipes_lib:chances/50 run function terf:entity/vehicle/hoverbike/thrust
execute if score damage terf_states matches 100.. on passengers run scoreboard players set @s[type=player] terf_data_P 30
execute if score damage terf_states matches 100.. run rotate @s ~-10 ~
execute if score damage terf_states matches 100.. run scoreboard players set @s datapipes_lib_power_storage 0

## Driver
scoreboard players set has_driver terf_states 0
execute if score @s datapipes_lib_power_storage matches 1.. on passengers if entity @s[type=player] run function terf:entity/vehicle/hoverbike/as_driver

#fall out of the sky when charge runs out
execute unless score @s datapipes_lib_power_storage matches 1.. if score damage terf_states matches ..99 run scoreboard players set @s terf_data_A 1

#turn off the hoverbike if it isnt moving and is on the ground
execute unless block ~ ~-0.2 ~ #terf:noclip if score @s terf_data_A matches 1 if score @s terf_data_X matches 0 if score @s terf_data_Y matches 0 if score @s terf_data_Z matches 0 run return fail

#display dashboard
scoreboard players operation thrust terf_states = @s terf_data_A
scoreboard players operation charge terf_states = @s datapipes_lib_power_storage
scoreboard players operation charge terf_states /= 50000 terf_states
execute if score @s datapipes_lib_power_storage matches 1.. on passengers run title @s actionbar ["Height: ",{"score":{"objective":"terf_states","name":"thrust"}},"% | Damage: ",{"score":{"objective":"terf_states","name":"damage"}},"% | Charge: ",{"score":{"objective":"terf_states","name":"charge"}},"%"]
execute if score damage terf_states matches 100.. on passengers run title @s actionbar {"text":"ENGINE DAMAGE CRITICAL! EJECT IMMEDIATELY!","color":"#FF0000"}

## Particles
#thruster particles
execute if score @s datapipes_lib_power_storage matches 1.. run particle minecraft:end_rod ^.28 ^.55 ^-0.95 ^ ^ ^-10000000000 0.00000000001 0 force
execute if score @s datapipes_lib_power_storage matches 1.. run particle minecraft:end_rod ^-.28 ^.55 ^-0.95 ^ ^ ^-10000000000 0.00000000001 0 force
execute if score damage terf_states matches 100.. run particle minecraft:flame ^.28 ^.55 ^-0.95 0 0 0 0.01 4 force
execute if score damage terf_states matches 100.. run particle minecraft:flame ^-.28 ^.55 ^-0.95 0 0 0 0.01 4 force

execute if score damage terf_states matches 75.. if score @s datapipes_lib_power_storage matches 1.. run particle large_smoke ^ ^1 ^1 0 0 0 0 1 force

#particles on lava and water
execute if block ~ ~-0.2 ~ water run particle splash ^ ^ ^.75 0.1 0.1 0.1 0 10 force
execute if block ~ ~-0.2 ~ lava run particle lava ^ ^ ^.75 0.1 0.1 0.1 0 1 force

## Sound
#calculate pitch
scoreboard players operation speed terf_states = @s terf_data_X
execute if score speed terf_states matches ..-1 run scoreboard players operation speed terf_states /= -1 terf_states

scoreboard players operation temp terf_states = @s terf_data_Z
execute if score temp terf_states matches ..-1 run scoreboard players operation temp terf_states /= -1 terf_states
scoreboard players operation speed terf_states += temp terf_states

scoreboard players operation pitch terf_states = speed terf_states

scoreboard players operation temp terf_states = @s terf_data_Y
execute if score temp terf_states matches ..-1 run scoreboard players operation temp terf_states /= -1 terf_states
scoreboard players operation pitch terf_states += temp terf_states

scoreboard players add pitch terf_states 2500
#normal sound
data modify storage terf:temp args set value {arg1:"playsound terf:alarms.alarm3 ambient @a[distance=0..] ~ ~ ~ 1 "}
#out of power sound
execute unless score @s datapipes_lib_power_storage matches 1.. run data modify storage terf:temp args set value {arg1:""}
#overload sound
execute if score damage terf_states matches 100.. run data modify storage terf:temp args set value {arg1:"playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 1 "} 

execute store result storage terf:temp args.arg2 float 0.0002 run scoreboard players get pitch terf_states
execute if score damage terf_states matches 100.. store result storage terf:temp args.arg2 float 0.0003 run scoreboard players get pitch terf_states
function datapipes_lib:require/with_args/2 with storage terf:temp args

## Rotation
execute if score @s datapipes_lib_power_storage matches 1.. on passengers rotated as @s[type=player] on vehicle run rotate @s ~ 0
execute store result entity @s Rotation[1] float -0.02 run scoreboard players get @s terf_data_Y
execute at @s on passengers if entity @s[type=item_display] run rotate @s ~ ~
#this dosent work for some reason: execute on passengers if entity @s[type=item_display] store success entity @s OnGround byte 1 store success score @s test unless score @s test matches 1

## Thrust from the ground, aka the entire hovering part
#Remove charge
scoreboard players operation temp terf_states = @s terf_data_A
scoreboard players operation temp terf_states *= 10 terf_states
execute store result score charge terf_states run scoreboard players operation @s datapipes_lib_power_storage -= temp terf_states
execute if score @s datapipes_lib_power_storage matches ..-1 run scoreboard players set @s datapipes_lib_power_storage 0
execute on passengers store result entity @s[type=item_display] item.components.minecraft:custom_model_data.colors[2] int 1 run scoreboard players get charge terf_states

scoreboard players set distance terf_states 0
function terf:entity/vehicle/hoverbike/downcast

scoreboard players operation thrust terf_states *= 100 terf_states
scoreboard players operation thrust terf_states /= distance terf_states
execute if score thrust terf_states matches 400.. run scoreboard players set thrust terf_states 400
scoreboard players operation @s terf_data_Y += thrust terf_states
execute if score damage terf_states matches 100.. if predicate datapipes_lib:chances/30 run scoreboard players remove @s terf_data_A 1

## Movement & collision
#gravity
scoreboard players remove @s terf_data_Y 33

execute store result storage terf:temp args.vx float 0.001 run scoreboard players get @s terf_data_X
execute store result storage terf:temp args.vy float 0.001 run scoreboard players get @s terf_data_Y
execute store result storage terf:temp args.vz float 0.001 run scoreboard players get @s terf_data_Z
tag @s add terf_currententity
function terf:entity/vehicle/hoverbike/args with storage terf:temp args
tag @s remove terf_currententity

## Banking to the side
execute on passengers if entity @s[type=item_display] store result score rotation_vector terf_states run data get entity @s Rotation[0]
execute store result score movement_vector terf_states run data get entity 0010ccd2-0010-cd37-0010-cd360010c8e1 Rotation[0]
scoreboard players operation rotation_vector terf_states -= movement_vector terf_states
execute if score rotation_vector terf_states matches 181.. run scoreboard players remove rotation_vector terf_states 360
execute if score rotation_vector terf_states matches ..-181 run scoreboard players add rotation_vector terf_states 360

scoreboard players operation temp terf_states = rotation_vector terf_states
execute if score temp terf_states matches 1.. run scoreboard players remove temp terf_states 90
execute if score temp terf_states matches ..-1 run scoreboard players add temp terf_states 90
scoreboard players operation temp terf_states *= 2 terf_states
execute unless score rotation_vector terf_states matches -90..90 run scoreboard players operation rotation_vector terf_states -= temp terf_states

scoreboard players operation rotation_vector terf_states *= speed terf_states

data modify storage terf:temp args set value {arg1:'data merge entity @s {start_interpolation:0,transformation:{left_rotation:{axis:[0.0f,0.0f,1.0f],angle:',arg3:'}}}'}
execute store result storage terf:temp args.arg2 float -0.000005 run scoreboard players get rotation_vector terf_states
execute on passengers if entity @s[type=item_display] run function datapipes_lib:require/with_args/3 with storage terf:temp args

## "Air" resistance
execute if score damage terf_states matches 100.. run return fail
scoreboard players operation @s terf_data_X *= hoverbike_floatyness terf_states
scoreboard players operation @s terf_data_Y *= hoverbike_floatyness terf_states
scoreboard players operation @s terf_data_Z *= hoverbike_floatyness terf_states

scoreboard players operation @s terf_data_X /= 1000 terf_states
scoreboard players operation @s terf_data_Y /= 1000 terf_states
scoreboard players operation @s terf_data_Z /= 1000 terf_states

#prevent being stuck on low speeds due to division inaccuracies
execute if score @s terf_data_X matches 1.. run scoreboard players remove @s terf_data_X 1
execute if score @s terf_data_Y matches 1.. run scoreboard players remove @s terf_data_Y 1
execute if score @s terf_data_Z matches 1.. run scoreboard players remove @s terf_data_Z 1
execute if score @s terf_data_X matches ..-1 run scoreboard players add @s terf_data_X 1
execute if score @s terf_data_Y matches ..-1 run scoreboard players add @s terf_data_Y 1
execute if score @s terf_data_Z matches ..-1 run scoreboard players add @s terf_data_Z 1

## Make the hoverbike slowly descend without a driver
execute if score ETratetimer terf_states matches 10 if score has_driver terf_states matches 0 if score @s terf_data_X matches 0 if score @s terf_data_Z matches 0 if score @s terf_data_A matches 2.. run scoreboard players remove @s terf_data_A 1