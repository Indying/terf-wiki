summon minecraft:item_display ~ ~ ~ {Tags:["terf_fbss"]}
loot replace entity @e[type=minecraft:item_display,tag=terf_fbss,distance=..0.1,limit=1,sort=nearest] hotbar.0 mine ~ ~ ~ diamond_pickaxe[enchantments={silk_touch:1}]
summon minecraft:falling_block 29999999 100 19999999 {Tags:["terf_fb"]}
execute positioned 29999999 100 19999999 run data modify entity @e[type=minecraft:falling_block,tag=terf_fb,distance=..0.1,limit=1,sort=nearest] BlockState.Name set from entity @e[type=minecraft:item_display,tag=terf_fbss,limit=1,sort=nearest] item.id
execute positioned 29999999 100 19999999 run tp @e[type=minecraft:falling_block,tag=terf_fb,distance=..0.1,limit=1,sort=nearest] @e[type=item_display,limit=1,tag=terf_fbss]
kill @e[type=item_display,tag=terf_fbss]
setblock ~ ~ ~ air