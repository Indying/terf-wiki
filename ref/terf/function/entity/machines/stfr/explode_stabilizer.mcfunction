summon tnt ~ ~ ~ {fuse:0}
playsound terf:explosion.missile ambient @a[distance=0..] ~ ~ ~ 6 0
playsound terf:explosion.tank_shot ambient @a[distance=0..] ~ ~ ~ 6 0
playsound terf:explosion.bang ambient @a[distance=0..] ~ ~ ~ 6 0
playsound terf:explosion.bang ambient @a[distance=0..] ~ ~ ~ 6 1
playsound minecraft:item.mace.smash_ground_heavy ambient @a[distance=0..] ~ ~ ~ 6 0.7
playsound minecraft:item.mace.smash_ground_heavy ambient @a[distance=0..] ~ ~ ~ 6 0.7

particle minecraft:poof ~ ~ ~ 0.5 0.5 0.5 1 2000 force

function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.bct.stab_overpressure',level:3,text:'{"text":"Fusion Reactor Stabilizer Overpressure! Lower Heat Transfer Immediately!","color":"yellow"}'}