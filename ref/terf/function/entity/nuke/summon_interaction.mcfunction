tag @s add terf_currententity
summon minecraft:interaction ~ ~ ~ {Tags:["terf_nuke","terf_currententity"],response:1,width:0.8,height:0.8}
ride @e[type=minecraft:interaction,tag=terf_currententity,limit=1] mount @e[type=minecraft:item_display,tag=terf_currententity,limit=1]
tag @e remove terf_currententity