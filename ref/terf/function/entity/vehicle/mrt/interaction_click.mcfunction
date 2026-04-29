execute at @s on target unless predicate datapipes_lib:pressing_sneak unless entity @a[distance=..1] run ride @s mount @n[type=interaction,tag=terf_mrt_main]

scoreboard players set temp terf_states 0
execute store result score temp terf_states on target run clear @s iron_nugget 9
execute if score temp terf_states matches 1.. run playsound minecraft:item.armor.equip_iron master @a[distance=0..] ~ ~ ~ 1 2
execute on passengers on passengers on passengers run scoreboard players operation @s terf_data_A += temp terf_states

data remove entity @s interaction

