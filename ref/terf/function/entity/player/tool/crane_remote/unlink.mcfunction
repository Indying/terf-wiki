summon minecraft:item_display ~ ~ ~ {Tags:["terf_fbss"]}

#put players held item into the item display
item replace entity @e[type=minecraft:item_display,tag=terf_fbss,limit=1] container.0 from entity @s weapon

#remove the linked_machine tag
data remove entity @e[type=minecraft:item_display,tag=terf_fbss,limit=1] item.components."minecraft:custom_data".terf.linked_machine

#put the item displays item back into the players held item
item replace entity @s weapon from entity @e[type=item_display,tag=terf_fbss,limit=1] container.0

kill @e[type=item_display,tag=terf_fbss]
tellraw @s [{"text":"["},{"text":"Crane Remote","color":"yellow"},{"text":"] Crane Connection Lost!"}]

playsound terf:alarms.toolbeep player @a[distance=0..] ~ ~ ~ 1 0