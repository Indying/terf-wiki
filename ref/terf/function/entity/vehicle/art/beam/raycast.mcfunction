scoreboard players set terminated terf_states 256
function terf:entity/vehicle/art/beam/radar_raycast

execute if score charge terf_states matches 419.. run scoreboard players set temp terf_states 1

execute if score temp terf_states matches 0 run return fail
scoreboard players set terminated terf_states 300
function terf:entity/vehicle/art/beam/power_raycast
particle minecraft:gust ^ ^ ^1.4 0 0 0 0 1 force

playsound terf:explosion.rocketfly ambient @a[distance=0..] ^ ^ ^5 10 2
playsound terf:explosion.rocketfly ambient @a[distance=0..] ^ ^ ^15 10 2
playsound terf:explosion.rocketfly ambient @a[distance=0..] ^ ^ ^20 10 2
playsound terf:explosion.rocketfly ambient @a[distance=0..] ^ ^ ^25 10 2
playsound terf:explosion.rocketfly ambient @a[distance=0..] ^ ^ ^30 10 2
playsound terf:explosion.rocketfly ambient @a[distance=0..] ^ ^ ^35 10 2
playsound terf:explosion.rocketfly ambient @a[distance=0..] ^ ^ ^40 10 2
playsound terf:explosion.rocketfly ambient @a[distance=0..] ^ ^ ^45 10 2
playsound terf:explosion.rocketfly ambient @a[distance=0..] ^ ^ ^50 10 2
