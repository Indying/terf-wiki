scoreboard players add @s terf_data_A 1
scoreboard players add @s terf_data_B 1

particle minecraft:dust{color:[0,0,0],scale:0.5}

scoreboard players set interpolation_duration terf_states 3000
scoreboard players operation interpolation_duration terf_states -= @s terf_data_A
execute if score @s terf_data_A matches 2000..4263 as @e[tag=terf_black_hole_beam,distance=..1] at @s run function terf:entity/black_hole/as_beam

execute if score @s terf_data_A matches 3000.. run playsound minecraft:ambient.basalt_deltas.loop master @a[distance=0..] ~ ~ ~ 5 2

execute if score @s terf_data_A matches 2999 run stopsound @a[distance=..80] * terf:explosion.rocketfly
execute if score @s terf_data_A matches 3000..3010 run particle minecraft:end_rod ~ ~ ~ 0 0 0 1 100 force
execute if score @s terf_data_A matches 3000..3010 run function terf:require/run_n_times {n:10,command:'playsound terf:explosion.explosion_far3 master @a[distance=0..] ~ ~ ~ 50 1'}
execute if score @s terf_data_A matches 3000.. run scoreboard players set @e[type=minecraft:marker,tag=datapipes_lib_power_consumer,distance=..100] datapipes_lib_power_storage 0
execute if score @s terf_data_A matches 3000..4263 run function terf:require/lightning_random {max_splits:100,splitp:'datapipes_lib:chances/39',contp:'datapipes_lib:chances/40'}
execute if score @s terf_data_A matches 3000 as @a[distance=..80] at @s run function terf:require/ceiling_dust/start
execute if score @s terf_data_A matches 3000 run scoreboard players add @a[distance=..80] terf_data_P 80

execute if score @s terf_data_A matches 3767 run particle minecraft:end_rod ~ ~ ~ 0 0 0 3 10000 force
execute if score @s terf_data_A matches 3767 run function terf:require/run_n_times {n:10,command:'playsound terf:explosion.huge_explosion master @a[distance=0..] ~ ~ ~ 50 0'}
execute if score @s terf_data_A matches 3767.. run function terf:require/run_n_times {n:200,command:'function terf:require/black_hole/random'}
execute if score @s terf_data_A matches 3767.. run playsound minecraft:ambient.basalt_deltas.mood master @a[distance=0..] ~ ~ ~ 5 2
execute if score @s terf_data_A matches 3767 run summon tnt ~ ~ ~ {fuse:0}

execute if score @s terf_data_A matches 4263 run summon minecraft:creeper ~ ~ ~ {ExplosionRadius:127,ignited:1b,Fuse:0,CustomName:"a quantum wave distortion"}
execute if score @s terf_data_A matches 4263 run function terf:entity/explosion/large_explosion/summon
execute if score @s terf_data_A matches 4267 run setblock ~ ~ ~ bedrock
execute if score @s terf_data_A matches 4267 run kill @e[distance=..1,tag=terf_black_hole]

execute as @a[distance=..6] run damage @s 1 terf:radiation at ~ ~ ~

execute if score @s terf_data_A matches 2000..2027 run function terf:require/run_n_times {n:10,command:'playsound terf:charge_up.mega_chargeup master @a[distance=0..] ~ ~ ~ 10 0'}

execute if score @s terf_data_A matches 3767.. run particle minecraft:dust{scale:4,color:[0,0,0]} ~ ~ ~ 0.2 0.2 0.2 0 100 force
execute if score @s terf_data_A matches 3000..3766 run particle minecraft:end_rod ~ ~ ~ 0 0 0 0.05 50 force

execute if score @s terf_data_A matches 3000.. run return fail

#hadron alarm sound
scoreboard players operation temp terf_states = @s terf_data_A
scoreboard players operation temp terf_states %= 70 terf_states
execute if score @s terf_data_A matches 200.. if score temp terf_states matches 0 if block ~ ~4 ~ minecraft:note_block run playsound terf:alarms.alarm5 master @a[distance=0..] ~ ~ ~ 5

#hadron particles
scoreboard players operation temp2 terf_states = @s terf_data_A
scoreboard players operation temp2 terf_states /= 40 terf_states

scoreboard players set temp terf_states 60
scoreboard players operation temp terf_states -= temp2 terf_states

execute if score @s terf_data_B > temp terf_states positioned ~ ~-1 ~ run function terf:entity/black_hole/hadron_simulate
