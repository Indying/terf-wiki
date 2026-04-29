execute if dimension minecraft:overworld run function terf_oldmapadditions:tartarus_door/blow_open

stopsound @a * terf:charge_up.reactordetonationcharging

execute as @a[distance=0..,tag=!terfoldmapadditions_inuppermap] at @s run function terf:require/ceiling_dust/start

playsound terf:explosion.explosion_far3 ambient @a[distance=..10000] ~ ~ ~ 100000000 1
playsound terf:explosion.explosion_far2 ambient @a[distance=..5000] ~ ~ ~ 100000000 0

playsound terf:explosion.explosion_far ambient @a[distance=..2500] ~ ~ ~ 100000000 0.5
playsound terf:explosion.explosion_far ambient @a[distance=..2500] ~ ~ ~ 100000000 0.6
playsound terf:explosion.explosion_far ambient @a[distance=..2500] ~ ~ ~ 100000000 0.7
playsound terf:explosion.explosion_far ambient @a[distance=..2500] ~ ~ ~ 100000000 0.8
playsound terf:explosion.explosion_far ambient @a[distance=..2500] ~ ~ ~ 100000000 0.9

playsound terf:explosion.reactorexplosion ambient @a[distance=..1000] ~ ~ ~ 100000000
playsound terf:explosion.reactorexplosion ambient @a[distance=..1000] ~ ~ ~ 100000000
playsound terf:explosion.reactorexplosion ambient @a[distance=..1000] ~ ~ ~ 100000000
playsound terf:explosion.reactorexplosion ambient @a[distance=..1000] ~ ~ ~ 100000000

playsound terf:explosion.huge_explosion ambient @a[distance=100..1000] ~ ~ ~ 10000 1
playsound terf:explosion.huge_explosion ambient @a[distance=100..1000] ~ ~ ~ 10000 1
playsound terf:explosion.huge_explosion ambient @a[distance=100..1000] ~ ~ ~ 10000 1
playsound terf:explosion.huge_explosion ambient @a[distance=100..1000] ~ ~ ~ 10000 1
playsound terf:explosion.huge_explosion ambient @a[distance=100..1000] ~ ~ ~ 10000 1
playsound terf:explosion.huge_explosion ambient @a[distance=100..1000] ~ ~ ~ 10000 1
playsound terf:explosion.huge_explosion ambient @a[distance=100..1000] ~ ~ ~ 10000 1
playsound terf:explosion.huge_explosion ambient @a[distance=100..1000] ~ ~ ~ 10000 1
playsound terf:explosion.huge_explosion ambient @a[distance=100..1000] ~ ~ ~ 10000 1
playsound terf:explosion.huge_explosion ambient @a[distance=100..1000] ~ ~ ~ 10000 1
playsound terf:explosion.huge_explosion ambient @a[distance=100..1000] ~ ~ ~ 10000 1
playsound terf:explosion.huge_explosion ambient @a[distance=100..1000] ~ ~ ~ 10000 1
playsound terf:explosion.huge_explosion ambient @a[distance=100..1000] ~ ~ ~ 10000 1
playsound terf:explosion.huge_explosion ambient @a[distance=100..1000] ~ ~ ~ 10000 1
playsound terf:explosion.huge_explosion ambient @a[distance=100..1000] ~ ~ ~ 10000 1
playsound terf:explosion.huge_explosion ambient @a[distance=100..1000] ~ ~ ~ 10000 1
playsound terf:explosion.huge_explosion ambient @a[distance=100..1000] ~ ~ ~ 10000 1
playsound terf:explosion.huge_explosion ambient @a[distance=100..1000] ~ ~ ~ 10000 1
playsound terf:explosion.huge_explosion ambient @a[distance=100..1000] ~ ~ ~ 10000 1
playsound terf:explosion.huge_explosion ambient @a[distance=100..1000] ~ ~ ~ 10000 1

particle minecraft:explosion_emitter ~ ~ ~ 8 8 8 1 500 force
particle minecraft:campfire_signal_smoke ~ ~ ~ 0 0 0 0.1 5000 force
execute as @a[distance=..35] run particle minecraft:flame ~ ~1 ~ 1 1 1 0.1 1000 force @s
execute positioned ~ ~ ~ as @a[distance=..128] at @s unless data entity @s RootVehicle run tp @s ~ ~ ~ ~ ~-50
stopsound @a * custom:airraidsiren
kill @e[name=terf_reactororbit]

execute if dimension minecraft:overworld run scoreboard players set map_destroyed terfmap_states 1

#give radiation
scoreboard players add @a[distance=..10] terf_data_A 9289
scoreboard players add @a[distance=..20] terf_data_A 9289
scoreboard players add @a[distance=..30] terf_data_A 9289
scoreboard players add @a[distance=..40] terf_data_A 9289
scoreboard players add @a[distance=..50] terf_data_A 9289
scoreboard players add @a[distance=..60] terf_data_A 9289
scoreboard players add @a[distance=..70] terf_data_A 9289
scoreboard players add @a[distance=..80] terf_data_A 9289
scoreboard players add @a[distance=..90] terf_data_A 9289
scoreboard players add @a[distance=..100] terf_data_A 9289
scoreboard players add @a[distance=..110] terf_data_A 9289
scoreboard players add @a[distance=..120] terf_data_A 9289
scoreboard players add @a[distance=..130] terf_data_A 9289
scoreboard players add @a[distance=..140] terf_data_A 9289
scoreboard players add @a[distance=..150] terf_data_A 9289
scoreboard players add @a[distance=..160] terf_data_A 9289
scoreboard players add @a[distance=..170] terf_data_A 9289
scoreboard players add @a[distance=..180] terf_data_A 9289
scoreboard players add @a[distance=..190] terf_data_A 9289
scoreboard players add @a[distance=..200] terf_data_A 9289
scoreboard players add @a[distance=..210] terf_data_A 9289
scoreboard players add @a[distance=..220] terf_data_A 9289
scoreboard players add @a[distance=..230] terf_data_A 9289
scoreboard players add @a[distance=..240] terf_data_A 9289
scoreboard players add @a[distance=..250] terf_data_A 9289
scoreboard players add @a[distance=..260] terf_data_A 9289
scoreboard players add @a[distance=..270] terf_data_A 9289
scoreboard players add @a[distance=..280] terf_data_A 9289
scoreboard players add @a[distance=..290] terf_data_A 9289

function terf:entity/fallout/summon {rad_incr:100,rad:200000,max_rad:10000000,int_div:30000,rad_decr:1}

#effects
kill @e[type=minecraft:item_display,tag=terf_explosioncloudflash]
kill @e[type=minecraft:item_display,tag=terf_explosionsurfaceflash]

data modify storage terf:temp args set value {arg1:"execute as @e[type=minecraft:text_display,tag=terf_related_",arg3:",tag=terf_overload_flare] run data merge entity @s {text_opacity:200,transformation:{scale:[2.0f,2.0f,2.0f]}}"}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/3 with storage terf:temp args

summon minecraft:item_display ~ 192 ~ {interpolation_duration:7000,brightness:{sky:15,block:15},Rotation:[0.0f,90.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosioncloudflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion_cloud"}}}
summon minecraft:item_display ~ 202 ~ {interpolation_duration:6000,brightness:{sky:15,block:15},Rotation:[0.0f,90.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosioncloudflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion_cloud"}}}
summon minecraft:item_display ~ 212 ~ {interpolation_duration:5000,brightness:{sky:15,block:15},Rotation:[0.0f,90.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosioncloudflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion_cloud"}}}
summon minecraft:item_display ~ 222 ~ {interpolation_duration:4000,brightness:{sky:15,block:15},Rotation:[0.0f,90.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosioncloudflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion_cloud"}}}
summon minecraft:item_display ~ 232 ~ {interpolation_duration:3000,brightness:{sky:15,block:15},Rotation:[0.0f,90.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosioncloudflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion_cloud"}}}
summon minecraft:item_display ~ 242 ~ {interpolation_duration:2000,brightness:{sky:15,block:15},Rotation:[0.0f,90.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosioncloudflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion_cloud"}}}

summon minecraft:item_display ~ ~50 ~ {interpolation_duration:140000,brightness:{sky:15,block:15},Rotation:[0.0f,90.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosionsurfaceflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion"}}}
summon minecraft:item_display ~ ~40 ~ {interpolation_duration:120000,brightness:{sky:15,block:15},Rotation:[0.0f,90.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosionsurfaceflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion"}}}
summon minecraft:item_display ~ ~30 ~ {interpolation_duration:100000,brightness:{sky:15,block:15},Rotation:[0.0f,90.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosionsurfaceflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion"}}}
summon minecraft:item_display ~ ~20 ~ {interpolation_duration:80000,brightness:{sky:15,block:15},Rotation:[0.0f,90.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosionsurfaceflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion"}}}
summon minecraft:item_display ~ ~10 ~ {interpolation_duration:60000,brightness:{sky:15,block:15},Rotation:[0.0f,90.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosionsurfaceflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion"}}}
summon minecraft:item_display ~ ~ ~ {interpolation_duration:40000,brightness:{sky:15,block:15},Rotation:[0.0f,90.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosionsurfaceflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion"}}}
summon minecraft:item_display ~ ~-10 ~ {interpolation_duration:60000,brightness:{sky:15,block:15},Rotation:[0.0f,90.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosionsurfaceflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion"}}}
summon minecraft:item_display ~ ~-20 ~ {interpolation_duration:80000,brightness:{sky:15,block:15},Rotation:[0.0f,90.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosionsurfaceflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion"}}}
summon minecraft:item_display ~ ~-30 ~ {interpolation_duration:100000,brightness:{sky:15,block:15},Rotation:[0.0f,90.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosionsurfaceflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion"}}}
summon minecraft:item_display ~ ~-40 ~ {interpolation_duration:120000,brightness:{sky:15,block:15},Rotation:[0.0f,90.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosionsurfaceflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion"}}}
summon minecraft:item_display ~ ~-50 ~ {interpolation_duration:140000,brightness:{sky:15,block:15},Rotation:[0.0f,90.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosionsurfaceflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion"}}}
summon minecraft:item_display ~ ~ ~ {billboard:vertical,interpolation_duration:140000,brightness:{sky:15,block:15},Rotation:[0.0f,0.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosionsurfaceflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion"}}}

summon minecraft:item_display ~ ~100 ~ {interpolation_duration:14000,brightness:{sky:15,block:15},Rotation:[0.0f,90.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosioncloudflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion_cloud"}}}
summon minecraft:item_display ~ ~80 ~ {interpolation_duration:12000,brightness:{sky:15,block:15},Rotation:[0.0f,90.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosioncloudflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion_cloud"}}}
summon minecraft:item_display ~ ~60 ~ {interpolation_duration:10000,brightness:{sky:15,block:15},Rotation:[0.0f,90.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosioncloudflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion_cloud"}}}
summon minecraft:item_display ~ ~40 ~ {interpolation_duration:8000,brightness:{sky:15,block:15},Rotation:[0.0f,90.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosioncloudflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion_cloud"}}}
summon minecraft:item_display ~ ~20 ~ {interpolation_duration:6000,brightness:{sky:15,block:15},Rotation:[0.0f,90.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosioncloudflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion_cloud"}}}
summon minecraft:item_display ~ ~ ~ {interpolation_duration:4000,brightness:{sky:15,block:15},Rotation:[0.0f,90.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosioncloudflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion_cloud"}}}
summon minecraft:item_display ~ ~-20 ~ {interpolation_duration:6000,brightness:{sky:15,block:15},Rotation:[0.0f,90.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosioncloudflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion_cloud"}}}
summon minecraft:item_display ~ ~-40 ~ {interpolation_duration:8000,brightness:{sky:15,block:15},Rotation:[0.0f,90.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosioncloudflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion_cloud"}}}
summon minecraft:item_display ~ ~-60 ~ {interpolation_duration:10000,brightness:{sky:15,block:15},Rotation:[0.0f,90.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosioncloudflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion_cloud"}}}
summon minecraft:item_display ~ ~-80 ~ {interpolation_duration:12000,brightness:{sky:15,block:15},Rotation:[0.0f,90.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosioncloudflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion_cloud"}}}
summon minecraft:item_display ~ ~-100 ~ {interpolation_duration:14000,brightness:{sky:15,block:15},Rotation:[0.0f,90.0f],view_range:100000,CustomName:"a High Energy Fusion Explosion",Tags:["terf_stfr_detonation","terf_explosioncloudflash"],item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/stfr/explosion_cloud"}}}

schedule function terf:entity/machines/stfr/states/detonation/transform 3t

scoreboard objectives remove terf_shake_magnitude
scoreboard objectives remove terf_shake_frequency

scoreboard objectives add terf_shake_magnitude dummy
scoreboard objectives add terf_shake_frequency dummy

scoreboard players set @a[distance=..256] terf_data_P 100

scoreboard players set @s terf_data_A 7
scoreboard players set @s terf_data_E 0
scoreboard players set @s terf_data_Ab 0

title @a times 5t 0t 10s
execute as @a[distance=..256] at @s if function terf_oldmapadditions:no_stfr_flash run function terf_oldmapadditions:stfrmuffledexplosioneffects
execute as @a[distance=..256] at @s unless function terf_oldmapadditions:no_stfr_flash run title @s title {"text":"\uEff4"}

#load chunks
data modify storage terf:temp args set value {load:1}
execute store result storage terf:temp args.radius int 16 run scoreboard players get stfr_explosion_load_radius terf_states
function terf:entity/machines/stfr/states/detonation/load_chunks with storage terf:temp args