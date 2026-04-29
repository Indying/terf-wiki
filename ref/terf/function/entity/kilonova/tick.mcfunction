scoreboard players add @s terf_data_A 1
execute if score @s terf_data_A matches 1 run playsound terf:charge_up.novacharge ambient @a ~ ~ ~ 1000000 0
execute if score @s terf_data_A matches 1 run playsound terf:charge_up.novacharge ambient @a ~ ~ ~ 1000000 0
execute if score @s terf_data_A matches 1 run playsound terf:charge_up.novacharge ambient @a ~ ~ ~ 1000000 0
execute if score @s terf_data_A matches 1 run playsound terf:charge_up.novacharge ambient @a ~ ~ ~ 1000000 0
execute if score @s terf_data_A matches 1 run playsound terf:charge_up.novacharge ambient @a ~ ~ ~ 1000000 0
execute if score @s terf_data_A matches 1 run playsound terf:charge_up.novacharge ambient @a ~ ~ ~ 1000000 0
execute if score @s terf_data_A matches 1 run playsound terf:charge_up.novacharge ambient @a ~ ~ ~ 1000000 0
execute if score @s terf_data_A matches 1 run playsound terf:charge_up.novacharge ambient @a ~ ~ ~ 1000000 0
execute if score @s terf_data_A matches 1 run playsound terf:charge_up.novacharge ambient @a ~ ~ ~ 1000000 0
execute if score @s terf_data_A matches 1 run playsound terf:charge_up.novacharge ambient @a ~ ~ ~ 1000000 0
execute if score @s terf_data_A matches 1 run playsound terf:charge_up.novacharge ambient @a ~ ~ ~ 1000000 0
execute if score @s terf_data_A matches 1 run playsound terf:charge_up.novacharge ambient @a ~ ~ ~ 1000000 0

execute if score @s terf_data_A matches 600 run playsound terf:explosion.hypernova ambient @a ~ ~ ~ 1000000 1
execute if score @s terf_data_A matches 600 run playsound terf:explosion.hypernova ambient @a ~ ~ ~ 1000000 0.9
execute if score @s terf_data_A matches 600 run playsound terf:explosion.hypernova ambient @a ~ ~ ~ 1000000 0.8
execute if score @s terf_data_A matches 600 run playsound terf:explosion.hypernova ambient @a ~ ~ ~ 1000000 0.7
execute if score @s terf_data_A matches 600 run playsound terf:explosion.hypernova ambient @a ~ ~ ~ 1000000 0.6
execute if score @s terf_data_A matches 600 run playsound terf:explosion.hypernova ambient @a ~ ~ ~ 1000000 0.5
execute if score @s terf_data_A matches 600 run playsound terf:explosion.hypernova ambient @a ~ ~ ~ 1000000 0.4
execute if score @s terf_data_A matches 600 run playsound terf:explosion.hypernova ambient @a ~ ~ ~ 1000000 0.3
execute if score @s terf_data_A matches 600 run playsound terf:explosion.hypernova ambient @a ~ ~ ~ 1000000 0.2
execute if score @s terf_data_A matches 600 run playsound terf:explosion.hypernova ambient @a ~ ~ ~ 1000000 0.1
execute if score @s terf_data_A matches 600 run playsound terf:explosion.hypernova ambient @a ~ ~ ~ 1000000 0
execute if score @s terf_data_A matches 600 as @a[distance=0..] at @s run particle flash{color:[1,1,1,1]} ~ ~ ~ 1 1 1 0 1000 force @s
execute if score @s terf_data_A matches 600 run effect give @a[distance=0..] minecraft:blindness 2 0 true
execute if score @s terf_data_A matches 600 run effect give @a[distance=0..] minecraft:slowness 2 255 true
execute if score @s terf_data_A matches 600 run effect give @a[distance=0..] minecraft:jump_boost 2 128 true
execute if score @s terf_data_A matches 600 as @a[distance=0..] at @s run particle minecraft:campfire_signal_smoke ~ ~1.6 ~ 1 1 1 0 2000 force @s
particle minecraft:campfire_signal_smoke ~ ~ ~ 1 1 1 0 100 force @s
particle minecraft:explosion ~ ~ ~ 0 0 0 500 1 force
particle minecraft:campfire_signal_smoke ~ ~ ~ 0 0 0 2 100 force
execute as @a[distance=0..] at @s run particle minecraft:campfire_cosy_smoke ~ ~ ~ 10 10 10 0.1 5 force @s
execute as @a[distance=0..] at @s run particle minecraft:large_smoke ~ ~ ~ 10 10 10 0 100 force @s
execute as @a[distance=0..] at @s run particle minecraft:flame ~ ~ ~ 10 10 10 1 500 force @s
execute as @a[distance=0..] at @s positioned ~ ~1.65 ~ run particle flash{color:[1,1,1,1]} ^ ^ ^0.4 0 0 0 1 1 force @s
summon minecraft:creeper ~ ~ ~ {Silent:1,Invulnerable:1,ExplosionRadius:127,Fuse:630,ignited:1,ActiveEffects:[{Id:14,Amplifier:0,Duration:650,ShowParticles:0b}],Tags:["kilonova"],CustomName:"a kilonova",CustomNameVisible:0,PersistenceRequired:1b}
execute if score @s terf_data_A matches 1 run summon minecraft:creeper ~0.1 ~0.05 ~0.2 {Attributes:[{Name:"generic.followRange",Base:0},{Name:"generic.movementSpeed",Base:0f}],Silent:1,Invulnerable:1,ExplosionRadius:127,Fuse:630,ignited:1,ActiveEffects:[{Id:14,Amplifier:0,Duration:650,ShowParticles:0b}],Tags:["kilonova"],CustomName:"a kilonova",CustomNameVisible:0,PersistenceRequired:1b}

execute if score @s terf_data_A matches 600.. run kill @s