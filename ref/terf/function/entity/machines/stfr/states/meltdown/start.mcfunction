playsound terf:music.explosionmusic ui @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 8 1

playsound terf:explosion.pressuregigaboom ambient @a[distance=0..] ~ ~ ~ 20 1
playsound terf:explosion.pressuregigaboom ambient @a[distance=0..] ~ ~ ~ 20 1
playsound terf:explosion.pressuregigaboom ambient @a[distance=0..] ~ ~ ~ 20 1
playsound terf:explosion.pressuregigaboom ambient @a[distance=0..] ~ ~ ~ 20 1
playsound terf:charge_up.reactordetonationcharging ambient @a[distance=0..] ~ ~ ~ 24 0
playsound terf:charge_up.reactordetonationcharging ambient @a[distance=0..] ~ ~ ~ 24 0.05

execute as @s[tag=terf_stab1] run function terf:entity/machines/stfr/stab_transform/off/stab_u
execute as @s[tag=terf_stab2] run function terf:entity/machines/stfr/stab_transform/off/stab_s
execute as @s[tag=terf_stab3] run function terf:entity/machines/stfr/stab_transform/off/stab_e
execute as @s[tag=terf_stab4] run function terf:entity/machines/stfr/stab_transform/off/stab_n
execute as @s[tag=terf_stab5] run function terf:entity/machines/stfr/stab_transform/off/stab_w
execute as @s[tag=terf_stab6] run function terf:entity/machines/stfr/stab_transform/off/stab_d

execute if score dev_mode terf_states matches 0 positioned ~4 ~ ~1 unless block ~ ~ ~ air run function terf:entity/machines/stfr/states/meltdown/liquify_reactor
execute if score dev_mode terf_states matches 0 positioned ~-4 ~-1 ~ unless block ~ ~ ~ air run function terf:entity/machines/stfr/states/meltdown/liquify_reactor
execute if score dev_mode terf_states matches 0 positioned ~ ~4 ~1 unless block ~ ~ ~ air run function terf:entity/machines/stfr/states/meltdown/liquify_reactor
execute if score dev_mode terf_states matches 0 positioned ~ ~-4 ~1 unless block ~ ~ ~ air run function terf:entity/machines/stfr/states/meltdown/liquify_reactor
execute if score dev_mode terf_states matches 0 positioned ~ ~1 ~4 unless block ~ ~ ~ air run function terf:entity/machines/stfr/states/meltdown/liquify_reactor
execute if score dev_mode terf_states matches 0 positioned ~-1 ~ ~-4 unless block ~ ~ ~ air run function terf:entity/machines/stfr/states/meltdown/liquify_reactor

summon minecraft:creeper ~ ~ ~ {CustomName:"a reactor shield shockwave",CustomNameVisible:1,Silent:1,Invulnerable:1,ExplosionRadius:20,Fuse:0,ignited:1,ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b}]}
summon minecraft:creeper ~ ~ ~ {CustomName:"a reactor shield shockwave",CustomNameVisible:1,Silent:1,Invulnerable:1,ExplosionRadius:20,Fuse:0,ignited:1,ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b}]}

function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.meltdown.start',level:4,text:'{"text":"Stage-I Internal Shield Lost! Expected Time Until Stage-II&III Shield Intensity Failure Is ~T-60 Seconds!","color":"red"}'}

stopsound @a[distance=0..] * terf:music.hacknet_ost_panic_track
stopsound @a[distance=0..] * terf:music.hacknet_ost_paki_trak
stopsound @a * terf:music.underload_music

playsound custom:airraidsiren ambient @a[distance=0..] ~ ~ ~ 16
playsound custom:airraidsiren ambient @a[distance=0..] ~ ~ ~ 16
playsound custom:airraidsiren ambient @a[distance=0..] ~ ~ ~ 16

scoreboard players set @a[distance=..80] terf_shake_magnitude 50
scoreboard players set @a[distance=..80] terf_shake_frequency 100

scoreboard players set @s terf_data_A 6
scoreboard players set @s terf_data_E 0

execute if dimension minecraft:overworld run function terf_oldmapadditions:stfr_phase_2
function terf:entity/machines/mainframe/crash_connected_mainframe

data modify storage terf:temp args set value {arg1:'execute as @e[type=minecraft:item_display,tag=terf_stfr_so_beam,tag=terf_related_',arg3:'] run kill @s'}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/3 with storage terf:temp args

data modify storage terf:temp args set value {arg1:"execute as @e[type=minecraft:marker,tag=terf_related_",arg3:",tag=terf_overload_beam] run kill @s"}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/3 with storage terf:temp args

data modify storage terf:temp args set value {arg1:'kill @e[type=item_display,tag=terf_related_',arg3:',tag=terf_stabilizer_skeleton]'}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/3 with storage terf:temp args

scoreboard players set terminated terf_states 500
data modify storage terf:temp args set from entity @s data.terf
data modify storage terf:temp args.max_duration set value 100
function terf:entity/machines/stfr/states/overload/shield_explosion_beams/iterate
