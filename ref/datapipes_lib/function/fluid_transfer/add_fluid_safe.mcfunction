$execute store success score succeeded datapipes_lib run data modify entity @s data.fluids[$(tank)].id set value '$(id)'
$execute if score succeeded datapipes_lib matches 1 run data modify entity @s data.fluids[$(tank)].amount set value 0

$execute store result score max datapipes_lib run data get entity @s data.fluids[$(tank)].max
$execute store result score amount datapipes_lib run data get entity @s data.fluids[$(tank)].amount
$scoreboard players add amount datapipes_lib $(amount)
execute if score amount datapipes_lib > max datapipes_lib run scoreboard players operation amount datapipes_lib = max datapipes_lib
$execute store result entity @s data.fluids[$(tank)].amount int 1 run scoreboard players get amount datapipes_lib

$tag @s add fluid_filter_$(id)