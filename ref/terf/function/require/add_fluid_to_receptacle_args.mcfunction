#load values from capsule
data remove storage terf:temp temp
$data modify storage terf:temp temp set from entity @n[type=item_display,tag=terf_receptacle_$(rid),tag=terf_related_$(machine_id)] item.components

#fail if capsule is not found
execute unless data storage terf:temp temp run return fail

#fail if capsule is full
execute store result score fluid_amount terf_states run data get storage terf:temp temp.minecraft:custom_data.fluids[0].amount
execute store result score fluid_max terf_states run data get storage terf:temp temp.minecraft:custom_data.fluids[0].max
execute if score fluid_amount terf_states >= fluid_max terf_states run return fail

#fail if capsule is not open
execute unless data storage terf:temp {temp:{"minecraft:custom_model_data":{floats:[5.0f]}}} run return fail

#fail if capsule fluid id isnt empty or dosent match added fluid id
data modify storage terf:temp temp2 set from storage terf:temp temp.minecraft:custom_data.fluids[0].id
scoreboard players set succeeded terf_states 0
execute unless data storage terf:temp {temp2:"empty"} store success score succeeded terf_states run data modify storage terf:temp temp.minecraft:custom_data.fluids[0].id set from storage terf:temp args.id
execute if score succeeded terf_states matches 1 run return fail

advancement grant @a[distance=..20] only terf:antimatter

#add to fluid amount
scoreboard players operation amount terf_states -= fluid_max terf_states
scoreboard players operation amount terf_states += fluid_amount terf_states
scoreboard players operation fluid_amount terf_states = fluid_max terf_states
execute if score amount terf_states matches ..-1 run scoreboard players operation fluid_amount terf_states += amount terf_states
execute if score amount terf_states matches ..-1 run scoreboard players set amount terf_states 0

execute store result storage terf:temp temp.minecraft:custom_data.fluids[0].amount int 1 run scoreboard players get fluid_amount terf_states
data modify storage terf:temp temp.minecraft:custom_data.fluids[0].id set from storage terf:temp args.id

$data modify storage terf:temp temp.minecraft:custom_model_data.colors[0] set from storage terf:constants fluid_dictionary.$(id).color_dec

#save changed values to capsule
$data modify entity @n[type=item_display,tag=terf_receptacle_$(rid),tag=terf_related_$(machine_id)] item.components set from storage terf:temp temp

data modify storage terf:temp temp set from storage terf:temp temp.minecraft:custom_data.fluids
function terf:require/make_fluid_lore
$data modify entity @n[type=item_display,tag=terf_receptacle_$(rid),tag=terf_related_$(machine_id)] item.components.minecraft:lore set from storage terf:temp output
