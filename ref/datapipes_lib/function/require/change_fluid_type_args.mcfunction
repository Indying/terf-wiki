$execute store result score error datapipes_lib run function $(changetype) with storage datapipes_lib:temp args
execute unless score error datapipes_lib matches 0 run return fail 
$tag @s remove fluid_filter_$(id)