scoreboard players set @s terf_data_A 0
execute store result score temp terf_states run data get entity @s data.fluids[0].amount
execute if score temp terf_states matches 0 run return fail
scoreboard players operation temp terf_states /= 2 terf_states
summon minecraft:text_display ~ ~ ~ {Tags:["terf_noslow","terf_random_col","terf_particle","terf_humongous_smoke"],billboard:"center",text:{"text":"\ueff5","color":"#222222"},background:0,view_range:400,teleport_duration:2,alignment:center}
execute store result entity @s data.fluids[0].amount int 1 run scoreboard players get temp terf_states

data remove storage terf:temp args
$data modify storage terf:temp args set from storage terf:constants fluid_dictionary.$(id)
data modify storage terf:temp args.amount set value 50
execute unless predicate datapipes_lib:can_see_sky unless entity @e[type=bat,tag=terf_gas,distance=..1] run function terf:require/fluid_into_gas