#limit some stuff
stopsound @s * terf:explosion.tau_cannon_shoot
execute if score @s terf_data_G matches 101.. run scoreboard players set @s terf_data_G 100

#play shooting sound
data modify storage terf:temp args set value {arg1:'playsound terf:explosion.tau_cannon_shoot player @a[distance=0..] ~ ~ ~ 2 '}
scoreboard players set temp terf_states 150
scoreboard players operation temp terf_states -= @s terf_data_G
execute store result storage terf:temp args.arg2 float 0.005 run scoreboard players get temp terf_states
function datapipes_lib:require/with_args/2 with storage terf:temp args

#"recoil" and screenshake
data modify storage terf:temp args set value {arg1:'execute at @s run rotate @s ~ ~-'}
execute store result storage terf:temp args.arg2 float 0.1 run scoreboard players get @s terf_data_G
execute if score @s terf_data_G matches 5.. run function datapipes_lib:require/with_args/2 with storage terf:temp args

scoreboard players operation @s terf_data_P += @s terf_data_G
scoreboard players operation @s terf_data_P /= 2 terf_states

#set arguments for the lightning in the beam
data modify storage terf:temp args set value {splitp:"datapipes_lib:chances/29",contp:"datapipes_lib:chances/30",particle:"particle minecraft:electric_spark ~ ~ ~ 0 0 0 0 1 force"}

#apply args
execute store result storage terf:temp args2.dpower float 0.02 run scoreboard players get @s terf_data_G
execute store result storage terf:temp args2.power float 0.01 run scoreboard players get @s terf_data_G
scoreboard players operation damage terf_states = @s terf_data_G
scoreboard players add damage terf_states 4
execute store result storage terf:temp args2.damage float 0.5 run scoreboard players get damage terf_states

#finally shoot the damn thing
scoreboard players set terminated terf_states 500
tag @s add terf_currententity
tag @s add terf_no_ray_damage
summon marker ^ ^ ^1 {UUID:[I;1101100,1101101,1100001,1101111]}
function terf:entity/player/tool/tau_cannon/raycast
kill 0010cd2c-0010-cd2d-0010-c8e10010cd37
tag @e remove terf_no_ray_damage
tag @s remove terf_currententity

#discharge
scoreboard players set @s terf_data_G 0
stopsound @a[distance=..16] * terf:charge_up.tau_cannon_charge

execute if score @s terf_data_C matches 1 run return fail
data modify storage terf:temp args set value {arg1:'item modify entity @s weapon.mainhand {"function":"minecraft:set_damage","damage":-',arg3:',"add":true}'}
execute store result storage terf:temp args.arg2 float 0.0005 run scoreboard players get damage terf_states
function datapipes_lib:require/with_args/3 with storage terf:temp args

data modify storage terf:temp args.arg1 set value 'item modify entity @s weapon.offhand {"function":"minecraft:set_damage","damage":-'
function datapipes_lib:require/with_args/3 with storage terf:temp args
