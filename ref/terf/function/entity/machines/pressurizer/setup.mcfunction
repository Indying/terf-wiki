data modify entity @s data.terf.multiblock_function set value 'run function terf:entity/machines/pressurizer/tick'
tag @s add fluid_filter_terf.oxygen

tag @s add terf_pressurizer
execute if block ~1 ~ ~ minecraft:waxed_cut_copper unless data entity @s data.fluids[{id:terf.oxygen}] run data modify entity @s data.fluids append value {max:30,amount:0,id:"terf.oxygen",outpos:"~1 ~ ~",checks:"if block ~1 ~ ~ red_glazed_terracotta"}
execute if block ~-1 ~ ~ minecraft:waxed_cut_copper unless data entity @s data.fluids[{id:terf.oxygen}] run data modify entity @s data.fluids append value {max:30,amount:0,id:"terf.oxygen",outpos:"~-1 ~ ~",checks:"if block ~-1 ~ ~ red_glazed_terracotta"}
execute if block ~ ~1 ~ minecraft:waxed_cut_copper unless data entity @s data.fluids[{id:terf.oxygen}] run data modify entity @s data.fluids append value {max:30,amount:0,id:"terf.oxygen",outpos:"~ ~1 ~",checks:"if block ~ ~1 ~ red_glazed_terracotta"}
execute if block ~ ~-1 ~ minecraft:waxed_cut_copper unless data entity @s data.fluids[{id:terf.oxygen}] run data modify entity @s data.fluids append value {max:30,amount:0,id:"terf.oxygen",outpos:"~ ~-1 ~",checks:"if block ~ ~-1 ~ red_glazed_terracotta"}
execute if block ~ ~ ~1 minecraft:waxed_cut_copper unless data entity @s data.fluids[{id:terf.oxygen}] run data modify entity @s data.fluids append value {max:30,amount:0,id:"terf.oxygen",outpos:"~ ~ ~1",checks:"if block ~ ~ ~1 red_glazed_terracotta"}
execute if block ~ ~ ~-1 minecraft:waxed_cut_copper unless data entity @s data.fluids[{id:terf.oxygen}] run data modify entity @s data.fluids append value {max:30,amount:0,id:"terf.oxygen",outpos:"~ ~ ~-1",checks:"if block ~ ~ ~-1 red_glazed_terracotta"}
