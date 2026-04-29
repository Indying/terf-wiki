#terf_data_A = depressurization cooldown
execute unless score ETratetimer terf_states matches 10.. run return fail
execute if dimension minecraft:overworld run return fail
execute if score @s terf_data_A matches 1.. run return run scoreboard players remove @s terf_data_A 1
execute store result score fluid_amount terf_states run data get entity @s data.fluids[0].amount

execute if score fluid_amount terf_states matches ..0 run return run execute if score @s terf_data_A matches -1 run function terf:entity/machines/pressurizer/depressurize with entity @s data.terf
execute unless score @s terf_data_A matches -1 if score fluid_amount terf_states matches 1.. run function terf:entity/machines/pressurizer/pressurize
execute if score @s terf_data_A matches -1 run particle minecraft:poof ~ ~ ~ 0 0 0 0.1 1 force

scoreboard players remove fluid_amount terf_states 1
execute store result entity @s data.fluids[0].amount int 1 run scoreboard players get fluid_amount terf_states

execute if predicate datapipes_lib:chances/10 run function terf:entity/machines/pressurizer/tp_random_stand with entity @s data.terf
