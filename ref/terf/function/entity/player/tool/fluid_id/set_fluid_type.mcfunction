#fail if the tanks type is not changeable
scoreboard players set error terf_states 0
execute unless data storage terf:temp temp[0].changetype run return run function terf:entity/player/tool/fluid_id/fail

#fail if tank is full
$execute store result score temp terf_states run data get entity @s data.fluids[{outpos:'$(outpos)'}].amount
scoreboard players set error terf_states -1
execute if score restricted_fluid_id terf_states matches 1 if score temp terf_states matches 1.. run return run function terf:entity/player/tool/fluid_id/fail

data modify storage terf:temp temp[0].new_id set from entity @p[tag=terf_currententity] SelectedItem.components.minecraft:custom_data.terf.fluid_type

function terf:entity/player/tool/fluid_id/run_changetype with storage terf:temp temp[0]
execute unless score error terf_states matches 0 run return run function terf:entity/player/tool/fluid_id/fail

$data modify entity @s data.fluids[{outpos:'$(outpos)'}].amount set value 0
$data modify entity @s data.fluids[{outpos:'$(outpos)'}].id set from storage terf:temp temp[0].new_id
title @p[tag=terf_currententity] actionbar [{"text":"Changed tank fluid type to ","color":"green"},{"nbt":"SelectedItem.components.minecraft:custom_data.terf.fluid_type","entity":"@p[tag=terf_currententity]"}]

$tag @s remove fluid_filter_$(id)
$function terf:entity/player/tool/fluid_id/add_filter_tag with entity @s data.fluids[{outpos:'$(outpos)'}] 

playsound terf:alarms.toolbeep player @a[distance=0..] ~ ~ ~ 1 0.8
playsound terf:alarms.beep4 player @a[distance=0..] ~ ~ ~ 1 0

function terf:entity/player/tool/fluid_id/particle {color:"0,1,0"}