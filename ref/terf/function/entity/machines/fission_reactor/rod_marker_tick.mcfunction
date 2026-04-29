#terf_data_A = temperature
#terf_data_B = decay
#terf_data_C = max decay

execute unless score @s terf_data_C = @s terf_data_C store result score @s terf_data_C run data get entity @s data.terf.fuel.max_decay

tag @s remove terf_radioactive
execute if block ~ ~ ~ light_blue_glazed_terracotta run tag @s add terf_radioactive

execute if score @s terf_data_A matches 1000.. as @s[tag=!terf_exploded] run function terf:entity/machines/fission_reactor/explode_core
execute unless block ~ ~ ~ #terf:fission_fuel_rod run function terf:entity/machines/fission_reactor/rod_marker_explode
execute if block ~ ~ ~ light_blue_glazed_terracotta if predicate datapipes_lib:chances/1 run function terf:entity/machines/fission_reactor/fuel_rod_split

#heat spread
scoreboard players operation temperature terf_states = @s terf_data_A
data remove storage terf:temp args.heat_spread
execute positioned ~1 ~ ~ if block ~ ~ ~ #terf:fission_fuel_rod run data modify storage terf:temp args.heat_spread append value "execute positioned ~1 ~ ~ run function terf:entity/machines/fission_reactor/heat_spread"
execute positioned ~-1 ~ ~ if block ~ ~ ~ #terf:fission_fuel_rod run data modify storage terf:temp args.heat_spread append value "execute positioned ~-1 ~ ~ run function terf:entity/machines/fission_reactor/heat_spread"
execute positioned ~ ~1 ~ if block ~ ~ ~ #terf:fission_fuel_rod run data modify storage terf:temp args.heat_spread append value "execute positioned ~ ~1 ~ run function terf:entity/machines/fission_reactor/heat_spread"
execute positioned ~ ~-1 ~ if block ~ ~ ~ #terf:fission_fuel_rod run data modify storage terf:temp args.heat_spread append value "execute positioned ~ ~-1 ~ run function terf:entity/machines/fission_reactor/heat_spread"
execute positioned ~ ~ ~1 if block ~ ~ ~ #terf:fission_fuel_rod run data modify storage terf:temp args.heat_spread append value "execute positioned ~ ~ ~1 run function terf:entity/machines/fission_reactor/heat_spread"
execute positioned ~ ~ ~-1 if block ~ ~ ~ #terf:fission_fuel_rod run data modify storage terf:temp args.heat_spread append value "execute positioned ~ ~ ~-1 run function terf:entity/machines/fission_reactor/heat_spread"
execute positioned ~1 ~1 ~ if block ~ ~ ~ #terf:fission_fuel_rod run data modify storage terf:temp args.heat_spread append value "execute positioned ~1 ~1 ~ run function terf:entity/machines/fission_reactor/heat_spread"
execute positioned ~-1 ~1 ~ if block ~ ~ ~ #terf:fission_fuel_rod run data modify storage terf:temp args.heat_spread append value "execute positioned ~-1 ~1 ~ run function terf:entity/machines/fission_reactor/heat_spread"
execute positioned ~ ~1 ~1 if block ~ ~ ~ #terf:fission_fuel_rod run data modify storage terf:temp args.heat_spread append value "execute positioned ~ ~1 ~1 run function terf:entity/machines/fission_reactor/heat_spread"
execute positioned ~ ~1 ~-1 if block ~ ~ ~ #terf:fission_fuel_rod run data modify storage terf:temp args.heat_spread append value "execute positioned ~ ~1 ~-1 run function terf:entity/machines/fission_reactor/heat_spread"
execute positioned ~1 ~-1 ~ if block ~ ~ ~ #terf:fission_fuel_rod run data modify storage terf:temp args.heat_spread append value "execute positioned ~1 ~-1 ~ run function terf:entity/machines/fission_reactor/heat_spread"
execute positioned ~-1 ~-1 ~ if block ~ ~ ~ #terf:fission_fuel_rod run data modify storage terf:temp args.heat_spread append value "execute positioned ~-1 ~-1 ~ run function terf:entity/machines/fission_reactor/heat_spread"
execute positioned ~ ~-1 ~1 if block ~ ~ ~ #terf:fission_fuel_rod run data modify storage terf:temp args.heat_spread append value "execute positioned ~ ~-1 ~1 run function terf:entity/machines/fission_reactor/heat_spread"
execute positioned ~ ~-1 ~-1 if block ~ ~ ~ #terf:fission_fuel_rod run data modify storage terf:temp args.heat_spread append value "execute positioned ~ ~-1 ~-1 run function terf:entity/machines/fission_reactor/heat_spread"
execute positioned ~1 ~ ~1 if block ~ ~ ~ #terf:fission_fuel_rod run data modify storage terf:temp args.heat_spread append value "execute positioned ~1 ~ ~1 run function terf:entity/machines/fission_reactor/heat_spread"
execute positioned ~-1 ~ ~1 if block ~ ~ ~ #terf:fission_fuel_rod run data modify storage terf:temp args.heat_spread append value "execute positioned ~-1 ~ ~1 run function terf:entity/machines/fission_reactor/heat_spread"
execute positioned ~1 ~ ~-1 if block ~ ~ ~ #terf:fission_fuel_rod run data modify storage terf:temp args.heat_spread append value "execute positioned ~1 ~ ~-1 run function terf:entity/machines/fission_reactor/heat_spread"
execute positioned ~-1 ~ ~-1 if block ~ ~ ~ #terf:fission_fuel_rod run data modify storage terf:temp args.heat_spread append value "execute positioned ~-1 ~ ~-1 run function terf:entity/machines/fission_reactor/heat_spread"

execute store result score temp terf_states run data get storage terf:temp args.heat_spread
scoreboard players remove temp terf_states 1

data modify storage terf:temp args2.arg1 set value "data modify storage terf:temp args.command set from storage terf:temp args.heat_spread["
data modify storage terf:temp args2.arg3 set value "]"

	data modify storage terf:temp args.arg1 set value "execute store result storage terf:temp args2.arg2 int 1 run random value 0.."
	execute store result storage terf:temp args.arg2 int 1 run scoreboard players get temp terf_states
	function datapipes_lib:require/with_args/2 with storage terf:temp args

function datapipes_lib:require/with_args/3 with storage terf:temp args2

function datapipes_lib:require/complex_function/1 with storage terf:temp args

#heat logic
scoreboard players operation temp terf_states = @s terf_data_A
scoreboard players operation temp terf_states /= 25 terf_states
scoreboard players add temp terf_states 2
execute if score temp terf_states matches 21.. run scoreboard players set temp terf_states 20

execute if block ~ ~1 ~ air if score @s terf_data_A matches 1.. run scoreboard players remove @s terf_data_A 1
execute if block ~ ~1 ~ water if score @s terf_data_A matches 10.. run scoreboard players operation @s terf_data_A -= temp terf_states
execute if block ~ ~1 ~ water if score @s terf_data_A matches 500.. positioned ~ ~1 ~ run function terf:entity/machines/fission_reactor/emmit_steam

#decay spread
execute positioned ~ ~1 ~ unless entity @e[type=minecraft:marker,tag=terf_fuel_rod,distance=..0.1] run return fail
scoreboard players operation decay terf_states = @s terf_data_B
execute positioned ~ ~1 ~ run scoreboard players operation decay terf_states += @e[type=minecraft:marker,tag=terf_fuel_rod,distance=..0.1] terf_data_B

scoreboard players operation temp terf_states = decay terf_states
scoreboard players operation temp terf_states %= 2 terf_states

scoreboard players operation decay terf_states /= 2 terf_states
scoreboard players operation other_decay terf_states = decay terf_states
scoreboard players operation other_decay terf_states += temp terf_states

scoreboard players operation @s terf_data_B = other_decay terf_states
execute positioned ~ ~1 ~ run scoreboard players operation @e[type=minecraft:marker,tag=terf_fuel_rod,distance=..0.1] terf_data_B = decay terf_states
