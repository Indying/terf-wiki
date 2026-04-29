scoreboard players set total_amount datapipes_lib 0

#turn on pipes
$execute positioned $(outpos) run $(pipe_on)

#count up the total amount of this fluids in the network
$execute as @e[type=marker,tag=datapipes_lib_fluid_generator,tag=fluid_filter_$(id)] at @s run function datapipes_lib:fluid_transfer/push/fluid_generator_connected with storage datapipes_lib:temp array[0]

#put the fluids into consumers
$execute if score total_amount datapipes_lib matches 1.. as @e[type=marker,tag=fluid_filter_$(id),tag=!datapipes_lib_current_fluid_generators] at @s run function datapipes_lib:fluid_transfer/push/fluid_consumer_connected with storage datapipes_lib:temp array[0]

#priorize fluid tanks and such
$execute if score total_amount datapipes_lib matches 1.. as @e[type=marker,tag=fluid_filter_$(id),tag=fluid_priority_1] at @s run function datapipes_lib:fluid_transfer/push/fluid_consumer_connected with storage datapipes_lib:temp array[0]

#put the remaining fluids back in the generators
execute if score total_amount datapipes_lib matches 1.. as @e[type=marker,tag=datapipes_lib_current_fluid_generators] at @s run function datapipes_lib:fluid_transfer/push/fluid_consumer_connected with storage datapipes_lib:temp array[0]
tag @e[type=marker,tag=datapipes_lib_current_fluid_generators] remove datapipes_lib_current_fluid_generators

#turn off pipes
$execute positioned $(outpos) run $(pipe_off)

execute if score total_amount datapipes_lib matches 1.. run say Datapipes Lib failure: total fluid amount above 1 after total return