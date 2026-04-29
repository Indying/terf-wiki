playsound minecraft:entity.warden.sonic_boom ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:entity.warden.sonic_boom ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:entity.warden.sonic_boom ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:entity.warden.sonic_boom ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:entity.warden.sonic_boom ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:entity.warden.sonic_boom ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:entity.warden.sonic_boom ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:entity.warden.sonic_boom ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:entity.warden.sonic_boom ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:entity.warden.sonic_boom ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:entity.warden.sonic_boom ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:entity.warden.sonic_boom ambient @a[distance=0..] ~ ~ ~ 20 0
playsound minecraft:entity.warden.sonic_boom ambient @a[distance=0..] ~ ~ ~ 20 0

playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 20 0
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 20 0
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 20 0
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 20 0
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 20 0
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 20 0
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 20 0
playsound terf:braam ambient @a[distance=0..] ~ ~ ~ 20 0

function terf:entity/machines/stfr/case_blowout
particle minecraft:sonic_boom ~ ~ ~ 5 5 5 1 500 force
particle minecraft:sculk_soul ~ ~ ~ 0 0 0 1 1000 force

function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.sculk.stabilization_failure',level:5,text:'{"text":"Complete Stabilization Failure! Evacuate The Facility Immediately!","color":"dark_aqua"}'}