playsound terf:explosion.mega_explosion ambient @a[distance=0..] ~ ~ ~ 10 0.5
playsound terf:explosion.mega_explosion ambient @a[distance=0..] ~ ~ ~ 10 0.6
playsound terf:explosion.mega_explosion ambient @a[distance=0..] ~ ~ ~ 10 0.7
playsound terf:explosion.mega_explosion ambient @a[distance=0..] ~ ~ ~ 10 0.8
playsound terf:explosion.mega_explosion ambient @a[distance=0..] ~ ~ ~ 10 0.9
playsound terf:explosion.mega_explosion ambient @a[distance=0..] ~ ~ ~ 10 1
playsound terf:explosion.mega_explosion ambient @a[distance=0..] ~ ~ ~ 10 1.1
playsound terf:explosion.mega_explosion ambient @a[distance=0..] ~ ~ ~ 10 1.2
playsound terf:explosion.mega_explosion ambient @a[distance=0..] ~ ~ ~ 10 1.3
playsound terf:explosion.mega_explosion ambient @a[distance=0..] ~ ~ ~ 10 1.4
playsound terf:explosion.mega_explosion ambient @a[distance=0..] ~ ~ ~ 10 1.5
playsound terf:explosion.mega_explosion ambient @a[distance=0..] ~ ~ ~ 10 1.6
playsound terf:explosion.mega_explosion ambient @a[distance=0..] ~ ~ ~ 10 1.7
playsound terf:explosion.mega_explosion ambient @a[distance=0..] ~ ~ ~ 10 1.8
playsound terf:explosion.mega_explosion ambient @a[distance=0..] ~ ~ ~ 10 1.9
playsound terf:explosion.mega_explosion ambient @a[distance=0..] ~ ~ ~ 10 2
particle minecraft:wax_off ~ ~ ~ 2 2 2 100 1000 force
execute positioned ~ ~2 ~ run fill ~2 ~2 ~2 ~-2 ~-2 ~-2 minecraft:fire replace air

data modify storage terf:temp args.command set value "execute if entity @s[type=player] run function terf:entity/machines/warp_core/states/warp/warp_fail_player"
function terf:entity/machines/warp_core/in_field_args with storage terf:temp args
