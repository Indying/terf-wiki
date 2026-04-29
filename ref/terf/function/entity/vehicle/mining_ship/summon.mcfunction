scoreboard players add currentcoreid terf_states 1

summon minecraft:interaction ~ ~ ~ {data:{terf:{destruction_override:"scoreboard players add @s terf_data_D 362170"}},Tags:["terf_vehicle","terf_mining_ship","terf_currententity","terf_vehicle_seat"]}
execute as @e[type=minecraft:interaction,tag=terf_vehicle,tag=terf_currententity] run data merge entity @s {width:0.0,height:0.0}
execute as @e[tag=terf_currententity,type=minecraft:interaction,tag=terf_vehicle] run scoreboard players operation @s terf_scorelink = currentcoreid terf_states

summon item_display ~ ~ ~ {item:{id:"carrot_on_a_stick",Count:1,components:{item_model:"terf:visual/mining_ship"}},teleport_duration:3,Tags:["terf_mining_ship","terf_currententity"]}
execute as @e[tag=terf_currententity,type=minecraft:item_display] run data merge entity @s {transformation:{scale:[4.0f,4.0f,4.0f]}}

#summon armor_stand ~ ~ ~ {Invisible:1b,Small:1b,DisabledSlots:4144959,Tags:["terf_mining_ship","terf_currententity"]}

summon minecraft:interaction ~ ~ ~ {Tags:["terf_click_detector","terf_mining_ship","terf_currententity"]}
execute as @e[type=minecraft:interaction,tag=terf_click_detector,tag=terf_currententity] run data merge entity @s {width:0.5,height:1.1}

summon minecraft:area_effect_cloud ~ ~ ~ {Radius:0,WaitTime:2147483647,Particle:{type:"minecraft:block",block_state:"minecraft:air"},Tags:["terf_mining_ship","terf_display_raiser_1","terf_currententity"]}
summon minecraft:area_effect_cloud ~ ~ ~ {Radius:0,WaitTime:2147483647,Particle:{type:"minecraft:block",block_state:"minecraft:air"},Tags:["terf_mining_ship","terf_display_raiser_2","terf_currententity"]}

data modify storage terf:temp args set value {arg1:"tag @e[tag=terf_mining_ship,tag=terf_currententity] add terf_related_"}
execute store result storage terf:temp args.arg2 int 1 run scoreboard players get currentcoreid terf_states
function datapipes_lib:require/with_args/2 with storage terf:temp args

ride @e[type=minecraft:item_display,limit=1,tag=terf_currententity] mount @e[type=minecraft:area_effect_cloud,tag=terf_currententity,tag=terf_display_raiser_1,limit=1]
ride @e[type=minecraft:area_effect_cloud,tag=terf_currententity,tag=terf_display_raiser_1,limit=1] mount @e[type=minecraft:area_effect_cloud,tag=terf_currententity,tag=terf_display_raiser_2,limit=1]
ride @e[type=minecraft:area_effect_cloud,tag=terf_currententity,tag=terf_display_raiser_2,limit=1] mount @e[type=minecraft:interaction,tag=terf_currententity,tag=terf_vehicle,limit=1]
ride @e[type=minecraft:interaction,tag=terf_currententity,tag=terf_click_detector,limit=1] mount @e[type=minecraft:interaction,tag=terf_currententity,tag=terf_vehicle,limit=1]

tag @e remove terf_currententity