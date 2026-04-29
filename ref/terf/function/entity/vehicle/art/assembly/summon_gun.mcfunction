tag @s add terf_currententity
summon item_display ~ ~ ~ {teleport_duration:2,Tags:["terf_art","terf_art_gun","terf_currententity"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[3f,3f,3f]},item:{id:"minecraft:carrot_on_a_stick",count:1,components:{item_model:"terf:visual/art/gun"}}}
ride @n[type=minecraft:item_display,tag=terf_currententity,tag=terf_art_gun] mount @n[type=minecraft:item_display,tag=terf_vehicle,tag=terf_art,tag=!terf_art_complete]
tag @e remove terf_currententity
tag @n[type=minecraft:item_display,tag=terf_vehicle,tag=terf_art,tag=!terf_art_complete] add terf_art_complete
execute on target run item modify entity @s weapon datapipes_lib:decrement_item
particle minecraft:crit ^.4 ^ ^ 0 0 0 0.1 50 force
particle minecraft:crit ^-.4 ^ ^ 0 0 0 0.1 50 force
playsound minecraft:item.armor.equip_gold player @a[distance=0..] ~ ~ ~ 1 0
playsound minecraft:item.armor.equip_gold player @a[distance=0..] ~ ~ ~ 1 2
playsound minecraft:entity.item.pickup player @a[distance=0..] ~ ~ ~ 1 0