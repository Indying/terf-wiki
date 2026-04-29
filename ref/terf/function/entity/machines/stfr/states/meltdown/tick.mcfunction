function terf:autokick

data modify storage terf:temp displays.group_core[0].messages[3][1][].color set value "white"
data modify storage terf:temp displays.group_core[0].messages[3][1][-1].color set value "red"
data modify storage terf:temp displays.group_core[0].messages[3][1][-2].color set value "red"
execute if score @s terf_data_E matches 1280 run data modify storage terf:temp displays.group_core[0].messages[3][1][-3].color set value "red"
execute if score @s terf_data_E matches 1280 run data modify storage terf:temp displays.group_core[0].messages[3][1][-4].color set value "red"

scoreboard players add @s terf_data_V 100
scoreboard players add @s terf_data_E 1

scoreboard players set terminated terf_states 10
data modify storage terf:temp args set from entity @s data.terf
data modify storage terf:temp args.max_duration set value 20
execute summon text_display run function terf:entity/machines/stfr/states/meltdown/dust/summon with storage terf:temp args
$execute as @e[type=text_display,tag=terf_stfr_meltdown_dust,tag=terf_related_$(machine_id)] at @s run function terf:entity/machines/stfr/states/meltdown/dust/as

$execute if score @s terf_data_E matches 5 as @e[type=item_display,tag=terf_stfr_shield_explosion,tag=terf_related_$(machine_id),distance=..1] run function terf:entity/machines/stfr/states/overload/shield_explosion_beams/tick
$execute if score @s terf_data_E matches 105 run kill @e[type=item_display,tag=terf_stfr_shield_explosion,tag=terf_related_$(machine_id),distance=..1]

scoreboard players set terminated terf_states 50
scoreboard players set temp terf_states 0
execute if predicate datapipes_lib:chances/50 run scoreboard players set temp terf_states 1
$execute if score @s terf_data_E matches 1280.. if score temp terf_states matches 0 if predicate datapipes_lib:chances/50 as @e[type=item_display,tag=terf_stfr_shield_explosion,tag=terf_related_$(machine_id)] at @s run tp @s ~ ~ ~ ~2 ~-1
$execute if score @s terf_data_E matches 1280.. if score temp terf_states matches 1 if predicate datapipes_lib:chances/50 as @e[type=item_display,tag=terf_stfr_shield_explosion,tag=terf_related_$(machine_id)] at @s run tp @s ~ ~ ~ ~-2 ~-1
execute if score @s terf_data_E matches 1280 run function terf:entity/machines/stfr/states/overload/shield_explosion_beams/iterate
execute if score @s terf_data_E matches 1320 run function terf:entity/machines/stfr/states/overload/shield_explosion_beams/iterate

scoreboard players operation temp terf_states = @s terf_data_E
scoreboard players operation temp terf_states %= 240 terf_states
execute if score temp terf_states matches 1 run playsound terf:alarms.airraidsiren ambient @a[distance=0..] ~ ~ ~ 50 1
execute if score temp terf_states matches 1 run playsound terf:alarms.airraidsiren ambient @a[distance=0..] ~ ~ ~ 50 1
execute if score temp terf_states matches 1 run playsound terf:alarms.airraidsiren ambient @a[distance=0..] ~ ~ ~ 50 1

$execute as @e[type=minecraft:text_display,tag=terf_related_$(machine_id),tag=terf_overload_flare,limit=2,sort=random] run function terf:entity/machines/stfr/states/overload/rotate_red_text_display

function terf:entity/machines/stfr/case_leak

execute if score @s terf_data_E matches 60 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.meltdown.shelter',level:4,text:'{"text":"TOTAL CONTAINMENT FAILURE! CORE EXPLOSION IS INEVITABLE! SEEK SHELTER IMMEDIATELY!","color":"red"}'}

function terf:entity/machines/stfr/calculations/extra

execute if score @s terf_data_E matches 400 run playsound terf:alarms.civil_alert_siren ambient @a[distance=0..] ~ ~ ~ 200
execute if score @s terf_data_E matches 5 run kill @e[type=minecraft:area_effect_cloud,distance=..5]
execute if score @s terf_data_E matches 1..60 as @e[type=falling_block,distance=..32] at @s run function terf:entity/machines/stfr/states/meltdown/falling_block_particles
execute if score @s terf_data_E matches 1398 run function terf:entity/machines/stfr/states/detonation/detonate_reactor
execute if score @s terf_data_E matches 1416.. run kill @s
execute if score @s terf_data_E matches ..1280 run particle minecraft:firework ~ ~ ~ 1 1 1 1 100 force
particle minecraft:soul_fire_flame ~ ~ ~ 1 1 1 0.1 100 force
particle minecraft:large_smoke ~ ~ ~ 1 1 1 1 100 force
execute if score @s terf_data_E matches ..1280 run particle minecraft:flame ~ ~ ~ 1 1 1 1 100 force
particle flash{color:[1,1,1,1]} ~ ~ ~ 10 10 10 1 100 normal @a[tag=!terf_epilepsy_mode]
particle minecraft:explosion ~ ~ ~ 0 0 0 2 1 force
execute if score @s terf_data_E matches 1280.. run particle minecraft:explosion_emitter ~ ~ ~ 1 1 1 1 1 force
execute if score @s terf_data_E matches 1280.. run particle minecraft:large_smoke ~ ~ ~ 1 1 1 2 200 force
execute if score @s terf_data_E matches 1280 run playsound terf:explosion.pressuregigaboom ambient @a[distance=0..] ~ ~ ~ 100 1
execute if score @s terf_data_E matches 1320 run playsound terf:explosion.pressuregigaboom ambient @a[distance=0..] ~ ~ ~ 100 2
execute if score @s terf_data_E matches 1280 run playsound terf:explosion.pressuregigaboom ambient @a[distance=0..] ~ ~ ~ 100 1
execute if score @s terf_data_E matches 1320 run playsound terf:explosion.pressuregigaboom ambient @a[distance=0..] ~ ~ ~ 100 2
execute if score @s terf_data_E matches 1280 run effect give @a[distance=..512] minecraft:blindness 1 0 true
execute if score @s terf_data_E matches 1320 run effect give @a[distance=..512] minecraft:blindness 1 0 true
execute if score @s terf_data_E matches 1280 positioned ~ ~ ~ as @a[distance=..128] at @s run tp @s ~ ~ ~ ~ ~-4
execute if score @s terf_data_E matches 1320 positioned ~ ~ ~ as @a[distance=..128] at @s run tp @s ~ ~ ~ ~ ~-4
execute if score @s terf_data_E matches 1280 run summon minecraft:creeper ~ ~ ~ {CustomName:"a reactor shield detonation shockwave",CustomNameVisible:1,Silent:1,Invulnerable:1,ExplosionRadius:13,Fuse:0,ignited:1,ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b}]}
execute if score @s terf_data_E matches 1320 run summon minecraft:creeper ~ ~ ~ {CustomName:"a reactor shield detonation shockwave",CustomNameVisible:1,Silent:1,Invulnerable:1,ExplosionRadius:13,Fuse:0,ignited:1,ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b}]}
$summon marker ~ ~ ~ {Tags:["terf_reactor_orbit","terf_related_$(machine_id)"]}
execute as @e[type=minecraft:marker,tag=terf_reactor_orbit] at @s run function terf:entity/machines/stfr/states/meltdown/as_orbital_particles
execute if score @s terf_data_E matches 101..120 run execute as @e[type=minecraft:marker,tag=terf_reactor_orbit] at @s run tp @s ^0.5 ^-0.1 ^
execute if score @s terf_data_E matches 121..220 run execute as @e[type=minecraft:marker,tag=terf_reactor_orbit] at @s run tp @s ^1 ^-0.1 ^
execute if score @s terf_data_E matches 221..270 run execute as @e[type=minecraft:marker,tag=terf_reactor_orbit] at @s run tp @s ^1 ^-0.1 ^0.1
execute if score @s terf_data_E matches 271..300 run execute as @e[type=minecraft:marker,tag=terf_reactor_orbit] at @s run tp @s ^2 ^0.1 ^-0.1
execute if score @s terf_data_E matches 301..380 run execute as @e[type=minecraft:marker,tag=terf_reactor_orbit] at @s run tp @s ^1 ^0.5 ^-0.1
execute if score @s terf_data_E matches 381..410 run execute as @e[type=minecraft:marker,tag=terf_reactor_orbit] at @s run tp @s ^1.5 ^-0.1 ^0.5
execute if score @s terf_data_E matches 411..420 run execute as @e[type=minecraft:marker,tag=terf_reactor_orbit] at @s run tp @s ^3 ^-0.2 ^-0.1
execute if score @s terf_data_E matches 421..520 run execute as @e[type=minecraft:marker,tag=terf_reactor_orbit] at @s run tp @s ^1.9 ^0.1 ^0.4
execute if score @s terf_data_E matches 521..550 run execute as @e[type=minecraft:marker,tag=terf_reactor_orbit] at @s run tp @s ^2 ^-0.3 ^0.1
execute if score @s terf_data_E matches 551..590 run execute as @e[type=minecraft:marker,tag=terf_reactor_orbit] at @s run tp @s ^1.9 ^0.1 ^-0.1
execute if score @s terf_data_E matches 591..610 run execute as @e[type=minecraft:marker,tag=terf_reactor_orbit] at @s run tp @s ^1 ^0.5 ^0.1
execute if score @s terf_data_E matches 611..700 run execute as @e[type=minecraft:marker,tag=terf_reactor_orbit] at @s run tp @s ^1.3 ^-0.1 ^0.9
execute if score @s terf_data_E matches 701..760 run execute as @e[type=minecraft:marker,tag=terf_reactor_orbit] at @s run tp @s ^1 ^0.5 ^0.1
execute if score @s terf_data_E matches 831..850 run execute as @e[type=minecraft:marker,tag=terf_reactor_orbit] at @s run tp @s ^1.9 ^0.1 ^-0.1
execute if score @s terf_data_E matches 851..900 run execute as @e[type=minecraft:marker,tag=terf_reactor_orbit] at @s run tp @s ^2 ^-0.3 ^0.1
execute if score @s terf_data_E matches 901..1010 run execute as @e[type=minecraft:marker,tag=terf_reactor_orbit] at @s run tp @s ^1.9 ^0.1 ^0.4
execute if score @s terf_data_E matches 1011..1120 run execute as @e[type=minecraft:marker,tag=terf_reactor_orbit] at @s run tp @s ^3 ^-0.2 ^-0.1
execute if score @s terf_data_E matches 1121..1160 run execute as @e[type=minecraft:marker,tag=terf_reactor_orbit] at @s run tp @s ^1.5 ^-0.1 ^0.5
execute if score @s terf_data_E matches 1161..1270 run execute as @e[type=minecraft:marker,tag=terf_reactor_orbit] at @s run tp @s ^1 ^0.5 ^-0.1
execute if score @s terf_data_E matches 1271..1310 run execute as @e[type=minecraft:marker,tag=terf_reactor_orbit] at @s run tp @s ^2 ^0.1 ^-0.1
execute if score @s terf_data_E matches 1311..1370 run execute as @e[type=minecraft:marker,tag=terf_reactor_orbit] at @s run tp @s ^1 ^-0.1 ^0.1
execute if score @s terf_data_E matches 1371..1380 run execute as @e[type=minecraft:marker,tag=terf_reactor_orbit] at @s run tp @s ^1 ^-0.1 ^
execute if score @s terf_data_E matches 1381..1390 run execute as @e[type=minecraft:marker,tag=terf_reactor_orbit] at @s run tp @s ^0.5 ^-0.1 ^
execute if score @s terf_data_E matches 1391..1400 run execute as @e[type=minecraft:marker,tag=terf_reactor_orbit] at @s run tp @s ^1 ^0.1 ^

execute if score @s terf_data_E matches 350 run fill ~9 ~ ~ ~9 ~ ~ air replace minecraft:netherite_block
execute if score @s terf_data_E matches 360 run fill ~-9 ~ ~ ~-9 ~ ~ air replace minecraft:netherite_block
execute if score @s terf_data_E matches 390 run fill ~ ~9 ~ ~ ~9 ~ air replace minecraft:netherite_block
execute if score @s terf_data_E matches 355 run fill ~ ~-9 ~ ~ ~-9 ~ air replace minecraft:netherite_block
execute if score @s terf_data_E matches 600 run fill ~ ~ ~9 ~ ~ ~9 air replace minecraft:netherite_block
execute if score @s terf_data_E matches 400 run fill ~ ~ ~-9 ~ ~ ~-9 air replace minecraft:netherite_block