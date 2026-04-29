playsound minecraft:entity.warden.sonic_boom block @a[distance=0..] ~ ~ ~ 2 1
particle minecraft:sonic_boom ~ ~ ~ 0 0 0 1 1 force
particle minecraft:sculk_soul ~ ~.5 ~ 0 0 0 1 1000 force
fill ~5 ~5 ~5 ~-5 ~-5 ~-5 air replace minecraft:cyan_stained_glass

summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_particle","terf_large_flash"],billboard:"center",text:{"text":"\ueef2","color":"aqua"},background:0,view_range:16,brightness:{sky:15,block:15},alignment:center}
playsound terf:explosion.explosion_far block @a[distance=0..] ~ ~ ~ 10

data modify storage terf:temp args set value {arg1:"kill @e[tag=terf_related_",arg3:"]"}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/3 with storage terf:temp args

playsound minecraft:block.glass.break block @a[distance=0..] ~3 ~ ~
playsound minecraft:block.glass.break block @a[distance=0..] ~-3 ~ ~
playsound minecraft:block.glass.break block @a[distance=0..] ~ ~ ~3
playsound minecraft:block.glass.break block @a[distance=0..] ~ ~ ~-3
playsound minecraft:block.glass.break block @a[distance=0..] ~3 ~ ~
playsound minecraft:block.glass.break block @a[distance=0..] ~-3 ~ ~
playsound minecraft:block.glass.break block @a[distance=0..] ~ ~ ~3
playsound minecraft:block.glass.break block @a[distance=0..] ~ ~ ~-3
playsound minecraft:block.glass.break block @a[distance=0..] ~3 ~ ~
playsound minecraft:block.glass.break block @a[distance=0..] ~-3 ~ ~
playsound minecraft:block.glass.break block @a[distance=0..] ~ ~ ~3
playsound minecraft:block.glass.break block @a[distance=0..] ~ ~ ~-3
playsound minecraft:block.glass.break block @a[distance=0..] ~3 ~ ~
playsound minecraft:block.glass.break block @a[distance=0..] ~-3 ~ ~
playsound minecraft:block.glass.break block @a[distance=0..] ~ ~ ~3
playsound minecraft:block.glass.break block @a[distance=0..] ~ ~ ~-3
playsound minecraft:block.glass.break block @a[distance=0..] ~3 ~ ~
playsound minecraft:block.glass.break block @a[distance=0..] ~-3 ~ ~
playsound minecraft:block.glass.break block @a[distance=0..] ~ ~ ~3
playsound minecraft:block.glass.break block @a[distance=0..] ~ ~ ~-3

tag @s add terf_sculk_disinfecting