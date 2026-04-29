#load data from capsule
$execute store result score capsule_amount terf_states run data get entity @s item.components.minecraft:custom_data.fluids[{id:'$(id)'}].amount 10000

#remove fuel
execute store result score amount terf_states run data get storage terf:temp array[0].amount
scoreboard players operation amount terf_states *= injection_multiplier terf_states
scoreboard players operation capsule_amount terf_states -= amount terf_states

execute if score capsule_amount terf_states matches ..-1 run scoreboard players set capsule_amount terf_states 0

#save data to capsule
$execute store result entity @s item.components.minecraft:custom_data.fluids[{id:'$(id)'}].amount double 0.0001 run scoreboard players get capsule_amount terf_states
$execute if score capsule_amount terf_states matches ..0 run data modify entity @s item.components.minecraft:custom_data.fluids[{id:'$(id)'}].id set value "empty"
$execute if score capsule_amount terf_states matches ..0 run tag @s remove terf_receptacle_contains_$(id)

execute if score capsule_amount terf_states matches 24.. run scoreboard players set succeeded terf_states 1