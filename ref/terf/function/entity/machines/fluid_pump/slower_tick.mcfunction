execute unless score @s datapipes_lib_power_storage matches 3.. run return fail
scoreboard players remove @s datapipes_lib_power_storage 3

execute unless data entity @s data.fluids[{id:water}] run data modify entity @s data.fluids append value {max:10000,amount:0,id:"water",outpos:"^ ^ ^1",checks:"positioned ^ ^ ^1 if function terf:require/observer_fluid_checks",pipe_on:'function terf:require/observer_output {cmd:"datapipes_lib:require/custom_pipe/pipes_on {axis:polished_basalt,corner:smooth_basalt}"}',pipe_off:'function terf:require/observer_output {cmd:"datapipes_lib:require/custom_pipe/pipes_off {axis:polished_basalt,corner:smooth_basalt}"}'}
tag @s add fluid_filter_water

execute store result score fluid_amount terf_states run data get entity @s data.fluids[0].amount
execute if score fluid_amount terf_states matches ..5000 if block ~ ~-2 ~ water[level=0] run function terf:entity/machines/fluid_pump/operation
execute store result entity @s data.fluids[0].amount int 1 run scoreboard players get fluid_amount terf_states
