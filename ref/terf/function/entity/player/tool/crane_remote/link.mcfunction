summon minecraft:item_display ~ ~ ~ {Tags:["terf_fbss"]}

#put players held item into the item display
item replace entity @e[type=minecraft:item_display,tag=terf_fbss,limit=1] container.0 from entity @s weapon

#set the linked_machine tag
data modify entity @e[type=minecraft:item_display,tag=terf_fbss,limit=1] item.components."minecraft:custom_data".terf.linked_machine set from entity @e[type=minecraft:marker,tag=terf_crane,dx=0,dy=0,dz=0,limit=1] data.terf.machine_id

#put the item displays item back into the players held item
item replace entity @s weapon from entity @e[type=item_display,tag=terf_fbss,limit=1] container.0

kill @e[type=item_display,tag=terf_fbss]
tellraw @s [{"text":"["},{"text":"Crane Remote","color":"yellow"},{"text":"] Crane Bound!"}]

playsound terf:alarms.toolbeep player @a[distance=0..] ~ ~ ~ 1