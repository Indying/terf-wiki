data modify storage terf:temp array append value [{text:"BUG"}," \u2714 ","-:-"]

execute store result score rid terf_states run data get entity @s data.terf.rid
execute if score rid terf_states matches 1 run data modify storage terf:temp array[-1][0].text set value "U"
execute if score rid terf_states matches 2 run data modify storage terf:temp array[-1][0].text set value "S"
execute if score rid terf_states matches 3 run data modify storage terf:temp array[-1][0].text set value "E"
execute if score rid terf_states matches 4 run data modify storage terf:temp array[-1][0].text set value "N"
execute if score rid terf_states matches 5 run data modify storage terf:temp array[-1][0].text set value "W"
execute if score rid terf_states matches 6 run data modify storage terf:temp array[-1][0].text set value "D"

execute unless block ^ ^.1 ^-.7 waxed_lightning_rod run data modify storage terf:temp array[-1][1] set value {text:" \u26a0 ",color:"red"}

$execute as @n[type=item_display,tag=terf_related_$(machine_id),tag=terf_receptacle_$(rid)] run function terf:entity/machines/stfr_control_panel/capsule_display/append with entity @s item.components.minecraft:custom_data.fluids[0]
