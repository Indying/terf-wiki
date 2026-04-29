scoreboard players add @s terf_data_E 1

particle explosion ~ ~ ~ 0 0 0 0 1 force

scoreboard players set max_splits terf_states 1000
data modify storage terf:temp args set value {splitp:"datapipes_lib:chances/10",contp:"datapipes_lib:chances/20",particle:"particle minecraft:electric_spark ~ ~ ~ 0 0 0 0 1 force"}
execute if score @s terf_data_E matches 100..250 run function datapipes_lib:require/run_in_all_directions {command:'execute positioned ^ ^ ^1 run function terf:require/lightning_split with storage terf:temp args',accuracy:10000}

$execute if score @s terf_data_E matches 410.. run kill @e[type=text_display,tag=terf_related_$(machine_id)]
execute if score @s terf_data_E matches 410.. run tag @s remove terf_warp_fail
execute if score @s terf_data_E matches 410.. run tag @s remove terf_indestructible
execute if score @s terf_data_E matches 410.. run scoreboard players set @s terf_data_A 0

execute if score @s terf_data_E matches 245 run function terf:entity/machines/warp_core/visuals/summon_cubes with storage terf:temp args
execute if score @s terf_data_E matches 250 run function terf:entity/machines/warp_core/states/warp/warp

$execute if score @s terf_data_E matches 350 run kill @e[type=minecraft:text_display,tag=terf_warp_core_vfx_cube,tag=terf_related_$(machine_id)]

#####################################################################################################################################

scoreboard players operation x terf_states = @s terf_data_U
scoreboard players operation z terf_states = @s terf_data_W
scoreboard players operation x terf_states *= 2 terf_states
scoreboard players operation z terf_states *= 2 terf_states
scoreboard players add x terf_states 1
scoreboard players add z terf_states 1
execute store result storage terf:temp args2.Daxis_x int 1 run scoreboard players get x terf_states
execute store result storage terf:temp args2.Daxis_z int 1 run scoreboard players get z terf_states
$execute if score @s terf_data_E matches 40 as @e[type=text_display,tag=terf_related_$(machine_id)] run function terf:entity/machines/warp_core/visuals/transform_top_displays with storage terf:temp args2

#####################################################################################################################################
execute store result storage terf:temp args2.axis_x int 1 run scoreboard players get @s terf_data_U
execute store result storage terf:temp args2.axis_z int 1 run scoreboard players get @s terf_data_W

execute store result storage terf:temp args2.Haxis_y float 0.5 run scoreboard players get @s terf_data_V

scoreboard players operation y terf_states = @s terf_data_V
scoreboard players operation y terf_states *= 2 terf_states
scoreboard players add y terf_states 1
execute store result storage terf:temp args2.Uaxis_y float 0.5 run scoreboard players get y terf_states

scoreboard players operation x terf_states = @s terf_data_U
scoreboard players operation z terf_states = @s terf_data_W
scoreboard players operation x terf_states *= 2 terf_states
scoreboard players operation z terf_states *= 2 terf_states
scoreboard players add x terf_states 1
scoreboard players add z terf_states 1
execute store result storage terf:temp args2.Daxis_x int 1 run scoreboard players get x terf_states
execute store result storage terf:temp args2.Daxis_z int 1 run scoreboard players get z terf_states
$execute if score @s terf_data_E matches 85 as @e[type=text_display,tag=terf_related_$(machine_id)] run function terf:entity/machines/warp_core/visuals/transform_side_displays with storage terf:temp args2

#####################################################################################################################################

#damage entites touching the field

#set args
execute store result storage terf:temp args.offset_x int -1 run scoreboard players get @s terf_data_R
execute store result storage terf:temp args.offset_y int -1 run scoreboard players get @s terf_data_S
execute store result storage terf:temp args.offset_z int -1 run scoreboard players get @s terf_data_T

execute store result storage terf:temp args.size_x int 1 run scoreboard players get @s terf_data_U
execute store result storage terf:temp args.size_y int 1 run scoreboard players get @s terf_data_V
execute store result storage terf:temp args.size_z int 1 run scoreboard players get @s terf_data_W

scoreboard players operation x terf_states = @s terf_data_U
scoreboard players operation y terf_states = @s terf_data_V
scoreboard players operation z terf_states = @s terf_data_W
execute store result storage terf:temp args.size_x_add int 1 run scoreboard players add x terf_states 1
execute store result storage terf:temp args.size_y_add int 1 run scoreboard players add y terf_states 1
execute store result storage terf:temp args.size_z_add int 1 run scoreboard players add z terf_states 1

execute if score @s terf_data_E matches 40.. run function terf:entity/machines/warp_core/warp/on_field_args with storage terf:temp args

#####################################################################################################################################

scoreboard players set opacity terf_states 110
scoreboard players set R terf_states 255
scoreboard players set G terf_states 255
scoreboard players set B terf_states 255

scoreboard players operation temp terf_states = @s terf_data_E
scoreboard players remove temp terf_states 40
scoreboard players operation temp terf_states *= 10 terf_states
execute if score temp terf_states matches 256.. run scoreboard players set temp terf_states 255

scoreboard players operation R terf_states -= temp terf_states
scoreboard players operation opacity terf_states -= temp terf_states
execute unless score opacity terf_states matches 26.. run scoreboard players set opacity terf_states 26

#increase opacity and R after the antimatter field
scoreboard players operation temp terf_states = @s terf_data_E
scoreboard players remove temp terf_states 120
execute if score temp terf_states matches ..-1 run scoreboard players set temp terf_states 0
scoreboard players operation temp terf_states *= 2 terf_states
execute if score temp terf_states matches 230.. run scoreboard players set temp terf_states 230

scoreboard players operation R terf_states += temp terf_states
scoreboard players operation opacity terf_states += temp terf_states

#decrease opacity and R after warping
scoreboard players operation temp terf_states = @s terf_data_E
scoreboard players remove temp terf_states 350
execute if score temp terf_states matches ..-1 run scoreboard players set temp terf_states 0
scoreboard players operation temp terf_states *= 4 terf_states

scoreboard players operation R terf_states -= temp terf_states
scoreboard players operation opacity terf_states -= temp terf_states

#set all colors except red to 0 if warp fails
execute if entity @s[tag=terf_warp_fail] run scoreboard players set G terf_states 0
execute if entity @s[tag=terf_warp_fail] run scoreboard players set B terf_states 0

execute if score @s terf_data_E matches 250 if entity @s[tag=terf_warp_fail] run function terf:entity/machines/warp_core/states/warp/warp_fail
execute if score @s terf_data_E matches 250.. if entity @s[tag=terf_warp_fail] run function terf:require/lightning_random {max_splits:100,splitp:'datapipes_lib:chances/10',contp:'datapipes_lib:chances/10'}

#convert color to RRGGBB in hex for displaying
data modify storage terf:temp args set value {arg1:'data modify storage terf:temp temp set value \'#',arg5:'\''}

execute store result storage terf:temp args.r int 1 run scoreboard players get R terf_states
execute store result storage terf:temp args.g int 1 run scoreboard players get G terf_states
execute store result storage terf:temp args.b int 1 run scoreboard players get B terf_states
function terf:require/rgb_to_hex with storage terf:temp args

function datapipes_lib:require/with_args/5 with storage terf:temp args
scoreboard players operation height terf_states = @s terf_data_B
scoreboard players operation temp terf_states = @s terf_data_E

#set color to text displays
$execute unless score @s terf_data_E matches 64..120 as @e[type=text_display,tag=terf_related_$(machine_id)] run function terf:entity/machines/warp_core/visuals/as_text_displays

#mass teleport the text displays after warping so they are visible
$execute unless score @s terf_data_E matches 250.. as @e[type=text_display,tag=terf_related_$(machine_id)] at @s run tp @s ~ ~ ~
