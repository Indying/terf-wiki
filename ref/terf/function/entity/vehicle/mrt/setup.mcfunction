summon minecraft:interaction ~ ~1.85 ~ {Tags:["terf_mrt_main","terf_mrt","terf_currententity","terf_vehicle"],width:0f,height:0f}
summon minecraft:interaction ~ ~ ~ {Tags:["terf_mrt_interaction","terf_mrt","terf_currententity","terf_seat"],width:0.7f,height:1.03f,data:{on_player_click:"function terf:entity/vehicle/mrt/interaction_click",on_player_hit:"function terf:entity/vehicle/mrt/interaction_hit"}}

summon item_display ~ ~ ~ {Tags:["terf_mrt_base","terf_mrt","terf_currententity"],item:{id:"minecraft:carrot_on_a_stick",components:{item_model:"terf:visual/mrt/base"}},transformation:{scale:[4f,4f,4f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f]},teleport_duration:2}
summon item_display ~ ~ ~ {Tags:["terf_mrt_mount","terf_mrt","terf_currententity"],item:{id:"minecraft:carrot_on_a_stick",components:{item_model:"terf:visual/mrt/mount"}},transformation:{scale:[4f,4f,4f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f]},teleport_duration:2}
summon item_display ~ ~ ~ {Tags:["terf_mrt_body","terf_mrt","terf_currententity"],item:{id:"minecraft:carrot_on_a_stick",components:{item_model:"terf:visual/mrt/body"}},transformation:{scale:[4f,4f,4f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f]},teleport_duration:2}
summon item_display ~ ~ ~ {Tags:["terf_mrt_gun","terf_mrt","terf_currententity"],item:{id:"minecraft:carrot_on_a_stick",components:{item_model:"terf:visual/mrt/gun"}},transformation:{scale:[4f,4f,4f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f]},teleport_duration:2}

ride @n[tag=terf_currententity,tag=terf_mrt_base] mount @n[tag=terf_currententity,tag=terf_mrt_gun]
ride @n[tag=terf_currententity,tag=terf_mrt_gun] mount @n[tag=terf_currententity,tag=terf_mrt_body]
ride @n[tag=terf_currententity,tag=terf_mrt_body] mount @n[tag=terf_currententity,tag=terf_mrt_mount]
ride @n[tag=terf_currententity,tag=terf_mrt_mount] mount @n[tag=terf_currententity,tag=terf_mrt_interaction]
ride @n[tag=terf_currententity,tag=terf_mrt_interaction] mount @n[tag=terf_currententity,tag=terf_mrt_main]

tag @e remove terf_currententity