playsound terf:music.idunno_reactor_meltdown_sequence ui @a[distance=..256,tag=!terf_disable_music] ~ ~ ~ 100000
function terf:entity/player/title_music {music:"iDunno - Reactor Meltdown Sequence (extended)"}

stopsound @a[distance=..128] * terf:music.alex_giudici_reconstructing_more_science_remix_v2

advancement grant @a[distance=..128] only terf:stfr/stfr_startup_failure

playsound terf:explosion.shieldboom ambient @a[distance=0..] ~ ~ ~ 16 2
playsound terf:explosion.shieldboom ambient @a[distance=0..] ~ ~ ~ 16 0
playsound terf:powerpurge ambient @a[distance=0..] ~ ~ ~ 10 0

scoreboard players add @a[distance=..256] terf_data_P 100
scoreboard players set @a[distance=..256] terf_shake_frequency 10
scoreboard players set @a[distance=..256] terf_shake_magnitude 5
scoreboard players set @s terf_data_A 12
scoreboard players set @s terf_data_E 0

particle minecraft:campfire_signal_smoke ~5 ~ ~ 0 0 0 0.2 400 force
particle minecraft:campfire_signal_smoke ~-5 ~ ~ 0 0 0 0.2 400 force
particle minecraft:campfire_signal_smoke ~ ~5.5 ~ 0 0 0 0.2 400 force
particle minecraft:campfire_signal_smoke ~ ~-4.5 ~ 0 0 0 0.2 400 force
particle minecraft:campfire_signal_smoke ~ ~ ~5 0 0 0 0.2 400 force
particle minecraft:campfire_signal_smoke ~ ~ ~-5 0 0 0 0.2 400 force

particle minecraft:large_smoke ~ ~.5 ~ 0 0 0 0.3 500 force

stopsound @a[distance=..512] * terf:music.the_final_flash_of_existance_remix 

data modify storage terf:temp args set value {arg1:"scoreboard players set @e[type=minecraft:marker,tag=terf_machineid_",arg3:"] terf_data_G 473"}
execute store result storage terf:temp args.arg2 int 1 run scoreboard players get @s terf_connected_mainframe
function terf:runwith_3args with storage terf:temp args

function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:5,text:'{"text":"Fusion Reactor Startup Sequence Failure! CODE: ","color":"dark_red"},{"text":"core_stats_outside_set_args","color":"red"}'}

effect give @a[distance=..35] minecraft:blindness 1 0 true

summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_particle","terf_small_flash"],billboard:"center",text:{"text":"\ueef2"},background:0,view_range:32,brightness:{sky:15,block:15},alignment:center}

summon minecraft:marker ~ ~ ~ {data:{power:{checks:"if block ^ ^14 ^ red_glazed_terracotta"}},Tags:["terf_stfr_so_helper","terf_connected_stab_1","datapipes_lib_power_consumer","terf_currententity"]}
summon minecraft:marker ~ ~ ~ {data:{power:{checks:"if block ^ ^ ^14 red_glazed_terracotta"}},Tags:["terf_stfr_so_helper","terf_connected_stab_2","datapipes_lib_power_consumer","terf_currententity"]}
summon minecraft:marker ~ ~ ~ {data:{power:{checks:"if block ^14 ^ ^ red_glazed_terracotta"}},Tags:["terf_stfr_so_helper","terf_connected_stab_3","datapipes_lib_power_consumer","terf_currententity"]}
summon minecraft:marker ~ ~ ~ {data:{power:{checks:"if block ^ ^ ^-14 red_glazed_terracotta"}},Tags:["terf_stfr_so_helper","terf_connected_stab_4","datapipes_lib_power_consumer","terf_currententity"]}
summon minecraft:marker ~ ~ ~ {data:{power:{checks:"if block ^-14 ^ ^ red_glazed_terracotta"}},Tags:["terf_stfr_so_helper","terf_connected_stab_5","datapipes_lib_power_consumer","terf_currententity"]}
summon minecraft:marker ~ ~ ~ {data:{power:{checks:"if block ^ ^-14 ^ red_glazed_terracotta"}},Tags:["terf_stfr_so_helper","terf_connected_stab_6","datapipes_lib_power_consumer","terf_currententity"]}

scoreboard players set @e[type=marker,tag=terf_stfr_so_helper] datapipes_lib_power_storage 0
scoreboard players set @e[type=marker,tag=terf_stfr_so_helper] datapipes_lib_power_max 10000

summon minecraft:item_display ~ ~ ~ {Tags:["terf_stfr_so_beam","terf_currententity"],item:{id:"minecraft:carrot_on_a_stick",components:{item_model:"terf:visual/stfr/light_beam"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[5f,5f,0f]},Rotation:[135f,35f]}
summon minecraft:item_display ~ ~ ~ {Tags:["terf_stfr_so_beam","terf_currententity"],item:{id:"minecraft:carrot_on_a_stick",components:{item_model:"terf:visual/stfr/light_beam"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[5f,5f,0f]},Rotation:[-135f,35f]}
summon minecraft:item_display ~ ~ ~ {Tags:["terf_stfr_so_beam","terf_currententity"],item:{id:"minecraft:carrot_on_a_stick",components:{item_model:"terf:visual/stfr/light_beam"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[5f,5f,0f]},Rotation:[45f,35f]}
summon minecraft:item_display ~ ~ ~ {Tags:["terf_stfr_so_beam","terf_currententity"],item:{id:"minecraft:carrot_on_a_stick",components:{item_model:"terf:visual/stfr/light_beam"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[5f,5f,0f]},Rotation:[-45f,35f]}

summon minecraft:item_display ~ ~ ~ {Tags:["terf_stfr_so_beam","terf_currententity"],item:{id:"minecraft:carrot_on_a_stick",components:{item_model:"terf:visual/stfr/light_beam"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[5f,5f,0f]},Rotation:[135f,-35f]}
summon minecraft:item_display ~ ~ ~ {Tags:["terf_stfr_so_beam","terf_currententity"],item:{id:"minecraft:carrot_on_a_stick",components:{item_model:"terf:visual/stfr/light_beam"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[5f,5f,0f]},Rotation:[-135f,-35f]}
summon minecraft:item_display ~ ~ ~ {Tags:["terf_stfr_so_beam","terf_currententity"],item:{id:"minecraft:carrot_on_a_stick",components:{item_model:"terf:visual/stfr/light_beam"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[5f,5f,0f]},Rotation:[45f,-35f]}
summon minecraft:item_display ~ ~ ~ {Tags:["terf_stfr_so_beam","terf_currententity"],item:{id:"minecraft:carrot_on_a_stick",components:{item_model:"terf:visual/stfr/light_beam"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[5f,5f,0f]},Rotation:[-45f,-35f]}

data modify storage terf:temp args set value {arg1:'tag @e[tag=terf_currententity] add terf_related_'}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/2 with storage terf:temp args
tag @e remove terf_currententity

execute positioned ~-14 ~-14 ~-14 as @a[dx=27,dy=27,dz=27] run scoreboard players add @s terf_data_A 912362335

