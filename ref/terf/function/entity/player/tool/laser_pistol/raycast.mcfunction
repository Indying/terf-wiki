particle dust{color:[1,0,0],scale:0.3} ~ ~ ~ 0 0 0 0 1 force
particle dust{color:[1,0,0],scale:0.3} ^ ^ ^-.1 0 0 0 0 1 force
particle dust{color:[1,0,0],scale:0.3} ^ ^ ^-.2 0 0 0 0 1 force
execute positioned ~-.5 ~-.5 ~-.5 as @e[type=!item,tag=!terf_currententity,dx=0,dy=0,dz=0] run function terf:entity/player/tool/laser_pistol/hit
scoreboard players remove temp terf_states 1
execute if score temp terf_states matches 1.. if block ~ ~ ~ #terf:laser_can_go_through positioned ^ ^ ^.3 run return run function terf:entity/player/tool/laser_pistol/raycast
execute unless score temp terf_states matches 1.. run return fail
execute if block ~ ~ ~ observer run return run function terf:entity/player/tool/laser_pistol/hit_observer

summon item_display ~ ~ ~ {UUID:[I;1101100,1101101,1100001,1101111]}
loot replace entity 0010cd2c-0010-cd2d-0010-c8e10010cd37 container.0 mine ~ ~ ~ netherite_pickaxe[minecraft:enchantments={"silk_touch":1}]
data modify storage terf:temp temp.type set from entity 0010cd2c-0010-cd2d-0010-c8e10010cd37 item.id
kill 0010cd2c-0010-cd2d-0010-c8e10010cd37
#function terf:require/cut_out_into_stair with storage terf:temp temp
#function terf:require/crack_block

particle flame ^ ^ ^-.3 0 0 0 0 1 force
playsound block.wool.break player @a[distance=0..] ~ ~ ~ 1 0
playsound block.wool.break player @a[distance=0..] ~ ~ ~ 1 0
playsound block.wool.break player @a[distance=0..] ~ ~ ~ 1 0
playsound block.wool.break player @a[distance=0..] ~ ~ ~ 1 0
playsound block.wool.break player @a[distance=0..] ~ ~ ~ 1 0
playsound block.wool.break player @a[distance=0..] ~ ~ ~ 1 0
playsound block.wool.break player @a[distance=0..] ~ ~ ~ 1 0

execute if block ~ ~ ~ redstone_block run return run setblock ~ ~ ~ pink_glazed_terracotta
execute if block ~ ~ ~ pink_glazed_terracotta run return run setblock ~ ~ ~ redstone_block
execute if block ~ ~ ~ redstone_lamp[lit=true] run return run setblock ~ ~ ~ redstone_lamp[lit=false]
execute if block ~ ~ ~ redstone_lamp[lit=false] run return run setblock ~ ~ ~ redstone_lamp[lit=true]

execute align xyz positioned ~.5 ~.5 ~.5 as @e[tag=terf_multiblockcore,distance=..0.6] run function terf:entity/player/tool/laser_pistol/hit_multiblock_core

execute unless block ~ ~ ~ tnt run return fail
setblock ~ ~ ~ air
execute align xyz run summon tnt ~.5 ~ ~.5 {fuse:5}
