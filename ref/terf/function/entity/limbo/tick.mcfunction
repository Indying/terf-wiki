scoreboard players add @s terf_data_A 1
execute if score @s terf_data_A matches 1 run function terf:entity/limbo/summon_tip
execute if score @s terf_data_A matches 2 run function terf:entity/limbo/move/start_pos
execute if score @s terf_data_A matches 30 run title @a[distance=..16] times 1 0 20
execute if score @s terf_data_A matches 30 run title @a[distance=..16] title {"text":"\ueff4","color":"red"}
execute if score @s terf_data_A matches 90 run title @a[distance=..16] times 5 30 10
execute if score @s terf_data_A matches 90 run title @a[distance=..16] title {"text":"-|-|-|-|-| FOCUS |-|-|-|-|-","bold":true}
execute if score @s terf_data_A matches 91 run title @a[distance=..16] title {"text":"-|-|-| FOCUSFOCUS |-|-|-","bold":true}
execute if score @s terf_data_A matches 92 run title @a[distance=..16] title {"text":"-| FOCUSFOCUSFOCUS |-","bold":true}
execute if score @s terf_data_A matches 93 run title @a[distance=..16] title {"text":"FOCUSFOCUSFOCUSFOCUS","bold":true}
execute if score @s terf_data_A matches 94 run title @a[distance=..16] title {"text":"FOCUSFOCUSFOCUS","bold":true}
execute if score @s terf_data_A matches 95 run title @a[distance=..16] title {"text":"FOCUSFOCUS","bold":true}
execute if score @s terf_data_A matches 96 run title @a[distance=..16] title {"text":"FOCUS","bold":true,"italic":true}

execute if score @s terf_data_A matches 150 run data merge entity @e[tag=terf_limbo_hint,type=item_display,sort=nearest,limit=1] {interpolation_duration:15,start_interpolation:0,item:{count:1,id:"minecraft:diamond_block"},transformation:{scale:[0.4,0.4,0.4]}}
execute if score @s terf_data_A matches 200 run data merge entity @e[tag=terf_limbo_hint,type=item_display,sort=nearest,limit=1] {interpolation_duration:15,start_interpolation:0,transformation:{scale:[0.0,0.0,0.0]}}

scoreboard players operation temp terf_states = @s terf_data_A
scoreboard players operation temp terf_states %= 6 terf_states
execute if score @s terf_data_A matches 30..414 if score temp terf_states matches 1 run scoreboard players add @a[distance=..16] terf_data_P 10
execute if score @s terf_data_A matches 30..414 if score temp terf_states matches 2 run scoreboard players set @a[distance=..16] terf_data_P 0

execute if score @s terf_data_A matches 220..414 if score temp terf_states matches 1 run function terf:entity/limbo/swap_random

execute if score @s terf_data_A matches 415 run title @a[distance=..16] times 1 0 70
execute if score @s terf_data_A matches 415 run title @a[distance=..16] title {"text":"\ueff4","color":"dark_blue"}
execute if score @s terf_data_A matches 415 run function terf:entity/limbo/move/end_pos

scoreboard players set succeeded terf_states 0
execute if score @s terf_data_A matches 415.. as @e[type=minecraft:interaction,tag=terf_limbo,distance=..3] if data entity @s interaction run function terf:entity/limbo/interaction
execute if score succeeded terf_states matches 2 run tag @s add terf_limbo_complete
execute if score succeeded terf_states matches 1.. run scoreboard players set @s terf_data_A 580

execute if score @s terf_data_A matches 580 as @e[type=minecraft:item_display,tag=terf_limbo,distance=..1] run data merge entity @s {item:{count:2},interpolation_duration:30,start_interpolation:0,transformation:{translation:[0.0f,0.0f,0.0f],left_rotation:[0.0,0.5,0.5,0.0]}}
execute if score @s terf_data_A matches 580 run kill @e[type=minecraft:interaction,distance=..4,tag=terf_limbo]
execute if score @s[tag=!terf_limbo_complete] terf_data_A matches 610.. run function terf:entity/limbo/end_fail
execute if score @s[tag=terf_limbo_complete] terf_data_A matches 610.. run function terf:entity/limbo/end_succeed

execute if score @s terf_data_A matches 480 run summon minecraft:text_display ~ ~ ~ {billboard:center,Tags:["terf_limbo"],alignment:center}

data modify storage terf:temp args set value {arg1:'data modify entity @s text set value \'"',arg3:'"\''}
scoreboard players operation temp terf_states = @s terf_data_A
scoreboard players remove temp terf_states 580
scoreboard players operation temp terf_states /= -1 terf_states
execute store result storage terf:temp args.arg2 int 0.05 run scoreboard players get temp terf_states
execute if score @s terf_data_A matches 480.. if score temp terf_states matches 0.. as @e[type=minecraft:text_display,tag=terf_limbo,distance=..1,limit=1] run function datapipes_lib:require/with_args/3 with storage terf:temp args

execute as @e[type=minecraft:item_display,tag=terf_limbo] run data modify entity @s item.count set value 1
