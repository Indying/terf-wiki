scoreboard players set raytermination terf_states 100

data modify storage terf:temp temp set from entity @s SelectedItem.components.minecraft:custom_data.terf.links
execute as @e[type=minecraft:marker,tag=terf_multiblockcore,distance=..1,limit=1] run function terf:entity/player/tool/linker/as_marker

particle minecraft:scrape ~ ~ ~ 1 0 0 0 100 force
particle minecraft:scrape ~ ~ ~ 0 1 0 0 100 force
particle minecraft:scrape ~ ~ ~ 0 0 1 0 100 force

scoreboard players set block_found terf_states 1
playsound terf:alarms.toolbeep player @a[distance=0..] ~ ~ ~ 1 0.8
playsound terf:alarms.beep4 player @a[distance=0..] ~ ~ ~ 1 0
tellraw @s [{"text":"["},{"text":"Linker","color":"light_purple"},{"text":"] Applied link-list to target"}]