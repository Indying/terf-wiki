execute unless score @s datapipes_lib_power_storage matches 70.. run return fail
scoreboard players remove @s datapipes_lib_power_storage 70
execute store result score fluid_amount terf_states run data get entity @s data.fluids[0].amount
execute if score fluid_amount terf_states matches ..999 if block ~ ~-6 ~ lava if block ~ ~-7 ~ bedrock run function terf:entity/machines/magma_drill/operation
