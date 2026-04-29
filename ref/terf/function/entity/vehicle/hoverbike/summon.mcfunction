summon interaction ~ ~ ~ {height:0.5f,width:0.7,response:1b,data:{terf:{destruction_override:"function terf:entity/vehicle/hoverbike/destruction_override"}},Tags:["terf_vehicle","terf_hoverbike","terf_seat","terf_currententity"],data:{on_player_click:"function terf:entity/vehicle/hoverbike/seat_click",on_player_hit:"function terf:entity/vehicle/hoverbike/seat_hit"}}
summon item_display ~ ~ ~ {interpolation_duration:5,teleport_duration:5,item:{id:"minecraft:carrot_on_a_stick",Count:1,components:{custom_data:{reachargable:1b,id:"terf:hoverbike",terf:{click:"terf:entity/vehicle/hoverbike/place",click_offhand:""}},item_name:"Hoverbike",item_model:"terf:visual/hoverbike",custom_model_data:{colors:[7368816,0,50000000]}}},Tags:["terf_hoverbike","terf_currententity"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.5f,1.5f,1.5f]}}

ride @n[type=item_display,tag=terf_currententity] mount @n[type=interaction,tag=terf_currententity]
scoreboard players set @n[type=interaction,tag=terf_currententity] terf_data_A 1
scoreboard players set @n[type=interaction,tag=terf_currententity] datapipes_lib_power_storage 5000000
scoreboard players set @n[type=interaction,tag=terf_currententity] datapipes_lib_power_max 5000000
tag @e remove terf_currententity