scoreboard players add @s terf_data_A 1
execute if score @s terf_data_A matches 1 run scoreboard players add currentcoreid terf_states 1
execute if score @s terf_data_A matches 1 run scoreboard players operation @s terf_scorelink = currentcoreid terf_states
execute if score @s terf_data_A matches 1 run execute store result entity @s data.terf.machine_id int 1 run scoreboard players get @s terf_scorelink
execute if score @s terf_data_A matches 1 run playsound terf:charge_up.energybuildup master @a[distance=0..] ~ ~ ~ 32 1

execute if score @s terf_data_A matches 1 run data modify storage terf:temp args set value {arg1:'summon item_display ~ ~-0.6 ~ {interpolation_duration:40,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,1000f,0f],scale:[3f,0f,3f]},Tags:["terf_orbital_strike_beam","terf_related_',arg3:'"],item:{id:"minecraft:carrot_on_a_stick",count:1,components:{item_model:"terf:visual/orbital_laser"}}}'}
execute if score @s terf_data_A matches 1 store result storage terf:temp args.arg2 int 1 run scoreboard players get @s terf_scorelink
execute if score @s terf_data_A matches 1 run function datapipes_lib:require/with_args/3 with storage terf:temp args

execute if score @s terf_data_A matches 4 run data modify storage terf:temp args set value {arg1:'execute as @e[type=minecraft:item_display,tag=terf_orbital_strike_beam,tag=terf_related_',arg3:'] run data merge entity @s {start_interpolation:0,transformation:{translation:[0f,1500f,0f],scale:[3f,1000f,3f]}}'}
execute if score @s terf_data_A matches 4 store result storage terf:temp args.arg2 int 1 run scoreboard players get @s terf_scorelink
execute if score @s terf_data_A matches 4 run function datapipes_lib:require/with_args/3 with storage terf:temp args

execute if score @s terf_data_A matches 298 run data modify storage terf:temp args set value {arg1:'execute as @e[type=minecraft:item_display,tag=terf_orbital_strike_beam,tag=terf_related_',arg3:'] run data merge entity @s {start_interpolation:0,transformation:{translation:[0f,0f,0f],scale:[3f,0f,3f]}}'}
execute if score @s terf_data_A matches 298 store result storage terf:temp args.arg2 int 1 run scoreboard players get @s terf_scorelink
execute if score @s terf_data_A matches 298 run function datapipes_lib:require/with_args/3 with storage terf:temp args

data modify storage terf:temp args set value {arg1:'execute as @e[type=minecraft:item_display,tag=terf_orbital_strike_particle,tag=terf_related_',arg3:'] run function terf:entity/orbital_strike/as_display'}
execute store result storage terf:temp args.arg2 int 1 run scoreboard players get @s terf_scorelink
function datapipes_lib:require/with_args/3 with storage terf:temp args

execute if score @s terf_data_A matches ..20 run function datapipes_lib:require/run_in_all_directions {accuracy:1000,command:'execute positioned ~ 200 ~ run particle minecraft:end_rod ^ ^ ^333 ^ ^ ^-30000000000 0.000000001 0 force'}

execute if score @s terf_data_A matches 500.. run function terf:entity/machines/multiblock_core_kill

execute unless score @s terf_data_A matches 44..338 run return fail
execute if score @s terf_data_A matches 45 run scoreboard players add @a[distance=..256] terf_data_P 10

particle flash{color:[1,1,1,1]} ~ ~300 ~ 0 300 0 0.1 100 force
particle minecraft:explosion ~ ~ ~ 0 0 0 10 1 force
function datapipes_lib:require/run_in_all_directions {accuracy:3000,command:'particle flame ~ ~ ~ ^ ^20000000000 ^20000000000 0.0000000001 0 force'}

scoreboard players add @a[distance=..256] terf_data_P 1
execute if predicate datapipes_lib:chances/10 run scoreboard players add @a[distance=..256] terf_data_P 2

execute if score @s terf_data_A matches ..100 run summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_particle","terf_humongous_fire"],billboard:"center",text:{"text":"\ueff5","color":"#111111"},background:0,view_range:730,brightness:{sky:15,block:15},teleport_duration:2,alignment:center}

function terf:entity/orbital_strike/summon_flash

function terf:entity/orbital_strike/summon_display
function terf:entity/orbital_strike/summon_display
function terf:entity/orbital_strike/summon_display
function terf:entity/orbital_strike/summon_display
function terf:entity/orbital_strike/summon_display

function terf:require/run_n_times {n:30,command:'function terf:entity/orbital_strike/raycast/random_down'}
function terf:require/run_n_times {n:30,command:'function terf:entity/orbital_strike/raycast/random_up'}

function terf:require/run_n_times {n:128,command:'function terf:entity/orbital_strike/raycast/random_toside'}
