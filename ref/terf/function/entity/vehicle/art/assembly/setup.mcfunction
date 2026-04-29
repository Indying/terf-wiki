tp @s ~ ~1.625 ~

tag @s add terf_currententity
summon minecraft:interaction ~ ~ ~ {data:{terf:{destruction_override:"function terf:entity/vehicle/art/destruction_override"}},Tags:["terf_art","terf_currententity"],response:1,width:0.8,height:0.8}
ride @n[type=minecraft:interaction,tag=terf_currententity] mount @n[type=minecraft:item_display,tag=terf_currententity]

summon minecraft:marker ~ ~ ~ {Tags:["terf_art","terf_currententity","terf_mainframe_interested"],response:1,width:0.8,height:0.8,data:{terf:{mainframe_logistics:{config:{input_coords:"~ ~-3 ~",is_input:1,load:10}},machine_name:"A_R_T"}}}
execute if entity @s[tag=terf_indestructible] run tag @n[type=minecraft:marker,tag=terf_currententity] add terf_indestructible
execute as @n[type=minecraft:marker,tag=terf_currententity] run function terf:entity/vehicle/art/assembly/as_summoned_marker
tag @e remove terf_currententity

execute as @s[tag=terf_indestructible] run function terf:entity/vehicle/art/assembly/summon_stand
execute as @s[tag=terf_indestructible] run function terf:entity/vehicle/art/assembly/summon_gun