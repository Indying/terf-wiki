scoreboard players add @s terf_data_A 10
scoreboard players add @s terf_data_B 1

execute if entity @e[type=minecraft:marker,tag=terf_neutron,distance=..0.25,limit=1] run return fail

execute unless data entity @s data.terf.fission_fuel.components.minecraft:custom_data.fission_fuel run return run setblock ~ ~ ~ air
data modify storage terf:temp temp set from entity @s data.terf.fission_fuel.components.minecraft:custom_data.fission_fuel

function terf:entity/neutron/summon
function terf:entity/neutron/summon