#check for recipe
data modify storage terf:temp args2 set value {name:"electric_press",a:"z"}

data remove storage terf:temp item
execute as @e[type=item,distance=..1,limit=1] run data modify storage terf:temp item set from entity @s Item

data modify storage terf:temp args2.a set from storage terf:temp item.id
execute store result score aa terf_states run data get storage terf:temp item.count

scoreboard players set temp terf_states 0
function terf:require/read_1_recipes with storage terf:temp args2

execute store result score a terf_states run data get storage terf:temp output.a

execute if data storage terf:temp output.z if score aa terf_states = a terf_states as @e[type=item,distance=..1] run kill @s
execute if data storage terf:temp output.z if score aa terf_states = a terf_states run data modify entity @s data.terf.stored_recipe set from storage terf:temp output