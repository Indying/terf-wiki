function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.shut_fail.restab_end',level:1,text:'{"text":"Shutdown Failure Restabilization Sequence Successful. Reactor Core Is Now Offline."}'}
tag @s remove terf_core_online

#shield boom
particle minecraft:explosion_emitter ~ ~ ~ 1 1 1 0 20 force
particle minecraft:firework ~ ~ ~ 1 1 1 1 1000 force

title @a[distance=..40] times 0 1 3
title @a[distance=..40] title "\ueff4"

effect give @a[distance=..35] minecraft:blindness 1 0 true

scoreboard players add @a[distance=..80] terf_data_P 60

playsound terf:explosion.shieldboom master @a[distance=0..] ~ ~ ~ 24 0.9
