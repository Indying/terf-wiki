tag @s add terf_currententity
summon item_display ~ ~ ~ {teleport_duration:2,Tags:["terf_art","terf_art_stand","terf_currententity"],item:{id:"minecraft:carrot_on_a_stick",count:1,components:{item_model:"terf:visual/art/stand"}}}
ride @n[type=minecraft:item_display,tag=terf_currententity,tag=terf_art_stand] mount @n[type=minecraft:item_display,tag=terf_vehicle,tag=terf_art,tag=!terf_art_complete]
tag @e remove terf_currententity
execute on target run item modify entity @s weapon datapipes_lib:decrement_item
particle minecraft:crit ~ ~-1.1 ~ 0.3 0 0.3 0 100 force
playsound minecraft:item.armor.equip_gold player @a[distance=0..] ~ ~ ~ 1 0
playsound minecraft:item.armor.equip_gold player @a[distance=0..] ~ ~ ~ 1 2
playsound minecraft:entity.item.pickup player @a[distance=0..] ~ ~ ~ 1 0