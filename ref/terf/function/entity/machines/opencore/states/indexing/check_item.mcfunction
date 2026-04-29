#check for recipe
data modify storage terf:temp args2 set value {name:"opencore",a:"z"}

data remove storage terf:temp item
$execute positioned ~ ~4 ~ positioned ~.5 ~$(half_height) ~.5 as @e[type=item,distance=..1,sort=random,limit=1,nbt={Motion:[0.0d,0.0d,0.0d]}] at @s run function terf:entity/machines/opencore/states/indexing/as_detected_item

data modify storage terf:temp args2.a set from storage terf:temp item.id
execute store result score aa terf_states run data get storage terf:temp item.count

scoreboard players set temp terf_states 0
function terf:require/read_1_recipes with storage terf:temp args2

execute store result score a terf_states run data get storage terf:temp output.a

execute unless data entity @s data.terf.stored_item if data storage terf:temp output.z if score aa terf_states = a terf_states run function terf:entity/machines/opencore/states/indexing/activated

execute if data storage terf:temp item run tag @e[type=item] remove terf_currententity

#attract all nearby items
execute store result score x terf_states run data get entity @s Pos[0] 100
execute store result score y terf_states run data get entity @s Pos[1] 100
execute store result score z terf_states run data get entity @s Pos[2] 100

scoreboard players add x terf_states 50

scoreboard players operation temp terf_states = @s terf_data_H
scoreboard players operation temp terf_states *= 50 terf_states
scoreboard players operation y terf_states += temp terf_states
scoreboard players add y terf_states 350
scoreboard players add z terf_states 50

execute store result storage terf:temp args.x double 0.01 run scoreboard players get x terf_states
execute store result storage terf:temp args.y double 0.01 run scoreboard players get y terf_states
execute store result storage terf:temp args.z double 0.01 run scoreboard players get z terf_states

execute as @e[type=item,distance=..20,sort=random,limit=3] at @s run function terf:entity/machines/opencore/attract with storage terf:temp args