kill @e[type=minecraft:end_crystal,distance=..3]

particle minecraft:end_rod ~ ~ ~ 1 1 1 0 1000 force
particle minecraft:end_rod ~ ~ ~ 1 1 1 3 1000 force
particle minecraft:end_rod ~ ~ ~ 1 1 1 1 1000 force
particle minecraft:firework ~ ~ ~ 1 1 1 1 1000 force
playsound terf:explosion.shieldboom ambient @a[distance=0..] ~ ~ ~ 24 1

scoreboard players set @s terf_data_A 5
scoreboard players set @s terf_data_E 90
scoreboard players add @s terf_data_L 151756756

scoreboard players add @a[distance=..80] terf_data_P 30

stopsound @a * terf:music.hacknet_ost_carpenter_brut

scoreboard players set @s terf_data_B 0

playsound terf:music.hacknet_ost_panic_track ui @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 16 1.02
execute as @a[distance=..256] run function terf:entity/player/title_music {music:"Hacknet OST: Remi Gallego - Panic Track"}

tag @s add terf_manual_stabilization_failed

function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.manual_restab.fail',level:3,text:'{"text":"Manual Reactor Restabilization Failure! Please Activate The Stasis Laser Immediately!","color":"red"}'}

function terf:entity/machines/stfr/states/overload/beam_explosion
function terf:entity/machines/stfr/states/overload/beam_explosion

function terf:entity/machines/stfr/states/overload/summon_red_text_displays