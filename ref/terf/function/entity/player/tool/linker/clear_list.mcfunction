#get type of block
summon minecraft:item_display ~ ~ ~ {Tags:["terf_fbss"]}

#put players held item into the item display
item replace entity @e[type=minecraft:item_display,tag=terf_fbss,limit=1] container.0 from entity @s weapon

#set list to {}
data modify entity @e[type=minecraft:item_display,tag=terf_fbss,limit=1] item.components."minecraft:custom_data".terf.links set value {connected_blocks:0}

#set players held item into the item display
item replace entity @s weapon from entity @e[type=item_display,tag=terf_fbss,limit=1] container.0

kill @e[type=item_display,tag=terf_fbss]
tellraw @s [{"text":"["},{"text":"Linker","color":"light_purple"},{"text":"] Cleared list"}]

playsound terf:alarms.toolbeep player @a[distance=0..] ~ ~ ~ 1 1.1
playsound terf:alarms.beep4 player @a[distance=0..] ~ ~ ~ 1 0