function terf:entity/machines/stfr/case_blowout
playsound terf:explosion.rocketfly ambient @a[distance=0..] ~ ~ ~ 10 1.2
playsound terf:explosion.rocketfly ambient @a[distance=0..] ~ ~ ~ 10 1.2
playsound terf:explosion.rocketfly ambient @a[distance=0..] ~ ~ ~ 10 1.2
playsound terf:explosion.rocketfly ambient @a[distance=0..] ~ ~ ~ 10 1.2
playsound terf:explosion.rocketfly ambient @a[distance=0..] ~ ~ ~ 10 1.2
playsound terf:explosion.rocketfly ambient @a[distance=0..] ~ ~ ~ 10 1.2
playsound terf:explosion.rocketfly ambient @a[distance=0..] ~ ~ ~ 10 1.2
playsound terf:explosion.rocketfly ambient @a[distance=0..] ~ ~ ~ 10 1.2
playsound terf:explosion.rocketfly ambient @a[distance=0..] ~ ~ ~ 10 1.2
playsound terf:explosion.rocketfly ambient @a[distance=0..] ~ ~ ~ 10 1.2

scoreboard objectives remove terf_shake_frequency
scoreboard objectives remove terf_shake_magnitudde

scoreboard objectives add terf_shake_frequency dummy
scoreboard objectives add terf_shake_magnitudde dummy

tag @s add terf_currententity
execute as @a[distance=..50] run damage @s 1 minecraft:explosion by @e[tag=terf_currententity,limit=1]
tag @s remove terf_currententity
