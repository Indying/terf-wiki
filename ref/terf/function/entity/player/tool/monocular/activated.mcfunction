summon item_display ~ ~ ~ {UUID:[I;488379,-385755,-141876,-44509]}
item replace entity 000773bb-fffa-1d25-fffd-d5ccffff5223 container.0 from entity @p weapon
execute store result score temp terf_states run data get entity 000773bb-fffa-1d25-fffd-d5ccffff5223 item.components.minecraft:custom_data.terf.monocular_offset

execute unless predicate datapipes_lib:pressing_sneak run scoreboard players add temp terf_states 1
execute if predicate datapipes_lib:pressing_sneak run scoreboard players remove temp terf_states 1
execute if score temp terf_states matches 33.. run scoreboard players set temp terf_states 32
execute if score temp terf_states matches ..-33 run scoreboard players set temp terf_states -32

title @s actionbar [{"text":"Monocular Offset: "},{"score":{"objective":"terf_states","name":"temp"}},{"text":" Blocks"}]
execute unless predicate datapipes_lib:pressing_sneak run playsound minecraft:block.stone_button.click_on player @a[distance=0..] ~ ~ ~ 1 1.1
execute if predicate datapipes_lib:pressing_sneak run playsound minecraft:block.stone_button.click_off player @a[distance=0..] ~ ~ ~ 1 1.1

execute store result entity 000773bb-fffa-1d25-fffd-d5ccffff5223 item.components.minecraft:custom_data.terf.monocular_offset int 1 run scoreboard players get temp terf_states
item replace entity @p weapon from entity 000773bb-fffa-1d25-fffd-d5ccffff5223 container.0
kill 000773bb-fffa-1d25-fffd-d5ccffff5223

data modify storage terf:temp args set value {arg1:'execute as @e[type=minecraft:marker,tag=terf_fuel_rod] at @s run particle minecraft:dust{scale:1,color:[1,1,1]} ~ ~',arg3:' ~ 0 0 0 0 5 force'}
data modify storage terf:temp args.arg2 set from entity @s SelectedItem.components.minecraft:custom_data.terf.monocular_offset
function datapipes_lib:require/with_args/3 with storage terf:temp args