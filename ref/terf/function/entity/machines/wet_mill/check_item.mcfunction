data modify block ^ ^1 ^ CustomName set value {"text":"Wet Mill: input"}

#check for recipe
data modify storage terf:temp args2 set value {name:"wet_mill",a:"z"}
data modify storage terf:temp args2.a set from block ~ ~ ~ item.id
data modify storage terf:temp args2.a set from block ~ ~ ~ item.components.minecraft:custom_data.id

function terf:require/read_1_recipes with storage terf:temp args2

execute unless data storage terf:temp output.z run return fail
execute store result score tank_amount terf_states run data get entity @s data.fluids[0].amount
execute store result score add_amount terf_states run data get storage terf:temp output.a
scoreboard players operation add_amount terf_states += tank_amount terf_states
execute if score add_amount terf_states matches 1001.. run return fail

data modify entity @s data.terf.stored_recipe set from storage terf:temp output
item modify block ~ ~ ~ container.0 datapipes_lib:decrement_item