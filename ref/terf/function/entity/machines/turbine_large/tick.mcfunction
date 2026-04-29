#add weird sound and explode the turbine when its powered and not connected to mainframe
execute unless score @s terf_connected_mainframe = @s terf_connected_mainframe if score @s terf_data_A matches 69.. as @s[tag=terf_turbinecase] at @s run playsound minecraft:entity.wither.shoot master @a[distance=0..] ~ ~ ~ 1 2
execute unless score @s terf_connected_mainframe = @s terf_connected_mainframe if score ETratetimer terf_states matches 10.. if predicate datapipes_lib:chances/0.1 if score @s terf_data_A matches 69.. as @s[tag=terf_turbinecase] run function terf:entity/machines/turbine_large/explode

#generate the power
execute if score NETratetimer terf_states >= NETrate terf_states run function terf:entity/machines/turbine_large/slower_tick
execute if score @s terf_data_A matches 1.. run playsound terf:machine_hum master @a[distance=0..] ~ ~ ~ 1 2

#when case is broken
execute if entity @s[tag=terf_turbinecase] run return fail
scoreboard players set steam_amount terf_states 0
execute store result score steam_amount terf_states run data get entity @s data.fluids[{id:terf.high_pressure_steam}].amount
execute unless score steam_amount terf_states matches 1.. run return fail

playsound minecraft:entity.wither.shoot master @a[distance=0..] ~ ~ ~ 2 0.6

particle minecraft:poof ^ ^ ^-8 0 0 0 1 10 force
particle minecraft:poof ^ ^ ^-6 0 0 0 1 10 force
particle minecraft:poof ^ ^ ^-3 0 0 0 1 10 force
particle minecraft:poof ^ ^ ^-1 0 0 0 1 10 force
particle minecraft:poof ^ ^ ^1 0 0 0 1 10 force
particle minecraft:poof ^ ^ ^3 0 0 0 1 10 force
particle minecraft:poof ^ ^ ^5 0 0 0 1 10 force

scoreboard players remove steam_amount terf_states 1
execute if score steam_amount terf_states > NETrate terf_states run scoreboard players operation steam_amount terf_states /= 2 terf_states
execute if score steam_amount terf_states matches ..-1 run scoreboard players set steam_amount terf_states 0
execute store result entity @s data.fluids[{id:terf.high_pressure_steam}].amount int 1 run scoreboard players get steam_amount terf_states
