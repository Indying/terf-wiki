tp @s ~ ~ ~

data modify entity @s data.terf.multiblock_function set value 'run function terf:entity/machines/stfr/tick with entity @s data.terf'
data modify entity @s data.terf.warp_off set value 'run function terf:entity/machines/stfr/stab_transform/warp_ready_off with entity @s data.terf'
data modify entity @s data.terf.warp_on set value 'run function terf:entity/machines/stfr/stab_transform/warp_ready_on with entity @s data.terf'
data modify entity @s data.terf.before_warp set value 'run function terf:entity/machines/stfr/structure_checks with entity @s data.terf'
data modify entity @s data.terf.reactivity_graph set value [""]
data modify entity @s data.terf.core_contents set value []

function terf:entity/machines/stfr/stab_transform/add_receptacle/stab_u
function terf:entity/machines/stfr/stab_transform/add_receptacle/stab_s
function terf:entity/machines/stfr/stab_transform/add_receptacle/stab_e
function terf:entity/machines/stfr/stab_transform/add_receptacle/stab_n
function terf:entity/machines/stfr/stab_transform/add_receptacle/stab_w
function terf:entity/machines/stfr/stab_transform/add_receptacle/stab_d

scoreboard players set @s terf_data_A 0
scoreboard players set @s terf_data_B 10000
scoreboard players set @s terf_data_D 0
scoreboard players set @s terf_data_E 0
scoreboard players set @s terf_data_F 0
scoreboard players set @s terf_data_G 0
scoreboard players set @s terf_data_H 0
scoreboard players set @s terf_data_I 0
scoreboard players set @s terf_data_J 0
scoreboard players set @s terf_data_K 90
scoreboard players set @s terf_data_L 0
scoreboard players set @s terf_data_M 0
scoreboard players set @s terf_data_N 100000
scoreboard players set @s terf_data_O 0
scoreboard players set @s terf_data_P 2200000
scoreboard players set @s terf_data_Q 0
scoreboard players set @s terf_data_R 0
scoreboard players set @s terf_data_S 0
scoreboard players set @s terf_data_T 0
scoreboard players set @s terf_data_U 0
scoreboard players set @s terf_data_Y 2147483647
scoreboard players set @s terf_data_W 0
scoreboard players set @s terf_data_Ad 1000000

tag @s remove terf_core_online
tag @s add terf_low_temp
tag @s add terf_high_temp
tag @s add terf_low_pressure_crit
tag @s add terf_low_pressure
tag @s add terf_low_core_spin
tag @s add terf_no_intake
tag @s add terf_stfr

#bcd
tag @s add terf_stab_pistons_breach
tag @s add terf_crit_coolant
tag @s add terf_low_coolant
tag @s add terf_low_fuel
tag @s add terf_fuel_crit
tag @s add terf_stab1_breach
tag @s add terf_stab2_breach
tag @s add terf_stab3_breach
tag @s add terf_stab4_breach
tag @s add terf_stab5_breach
tag @s add terf_stab6_breach

tag @s add datapipes_lib_fluid_generator
tag @s add fluid_filter_terf.gold_slurry
tag @s add fluid_filter_water
tag @s add fluid_filter_terf.high_pressure_steam
tag @s add fluid_filter_terf.deuterium
tag @s add fluid_filter_terf.helium

data modify entity @s data.fluids append value {max:83580000,amount:0,id:"terf.high_pressure_steam",outpos:"",checks:"",pipe_on:"function datapipes_lib:require/custom_pipe/pipes_on {axis:quartz_pillar,corner:chiseled_quartz_block}",pipe_off:"function datapipes_lib:require/custom_pipe/pipes_off {axis:quartz_pillar,corner:chiseled_quartz_block}"}
data modify entity @s data.fluids append value {max:3582000,amount:0,id:"water",outpos:"",checks:""}
data modify entity @s data.fluids append value {max:1000,amount:0,id:"terf.gold_slurry",outpos:"",checks:"",changetype:""}

data modify entity @s data.terf.machine_name set value S.T.F.R
data modify entity @s data.terf.mainframe_logistics.config set value {is_output:1,load:30,can_link_to:{stfr_controller:1}}
tag @s add terf_mainframe_interested

data modify entity @s data.terf.breaker_config.command set value 'function terf:entity/machines/stfr/check_for_breakers'

summon item_display ~5 ~ ~ {Tags:["terf_currententity","terf_stabilizer_skeleton"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[8f,8f,8f]},item:{id:"minecraft:stone",count:1,components:{"minecraft:item_model":"terf:visual/stfr/stabilizer_skeleton"}},Rotation:[270f,0f]}
summon item_display ~-5 ~ ~ {Tags:["terf_currententity","terf_stabilizer_skeleton"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[8f,8f,8f]},item:{id:"minecraft:stone",count:1,components:{"minecraft:item_model":"terf:visual/stfr/stabilizer_skeleton"}},Rotation:[90f,0f]}
summon item_display ~ ~5 ~ {Tags:["terf_currententity","terf_stabilizer_skeleton"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[8f,8f,8f]},item:{id:"minecraft:stone",count:1,components:{"minecraft:item_model":"terf:visual/stfr/stabilizer_skeleton"}},Rotation:[0f,-90f]}
summon item_display ~ ~-5 ~ {Tags:["terf_currententity","terf_stabilizer_skeleton"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[8f,8f,8f]},item:{id:"minecraft:stone",count:1,components:{"minecraft:item_model":"terf:visual/stfr/stabilizer_skeleton"}},Rotation:[0f,90f]}
summon item_display ~ ~ ~5 {Tags:["terf_currententity","terf_stabilizer_skeleton"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[8f,8f,8f]},item:{id:"minecraft:stone",count:1,components:{"minecraft:item_model":"terf:visual/stfr/stabilizer_skeleton"}},Rotation:[0f,0f]}
summon item_display ~ ~ ~-5 {Tags:["terf_currententity","terf_stabilizer_skeleton"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[8f,8f,8f]},item:{id:"minecraft:stone",count:1,components:{"minecraft:item_model":"terf:visual/stfr/stabilizer_skeleton"}},Rotation:[180f,0f]}

$tag @e[type=item_display,tag=terf_currententity] add terf_related_$(machine_id)
tag @e[type=item_display] remove terf_currententity