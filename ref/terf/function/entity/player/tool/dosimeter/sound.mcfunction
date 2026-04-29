scoreboard players operation temp terf_states = @s terf_data_A
execute if score temp terf_states matches 230.. run scoreboard players set temp terf_states 230

data modify storage terf:temp args set value {arg1:'execute if predicate datapipes_lib:chances/',arg3:' run playsound terf:geiger_counter.tick_lvl1 player @a[distance=0..] ~ ~ ~ 0.5 1'}
execute store result storage terf:temp args.arg2 int 3 run scoreboard players get temp terf_states
execute if predicate datapipes_lib:chances/50 run function datapipes_lib:require/with_args/3 with storage terf:temp args
scoreboard players remove temp terf_states 10

##
data modify storage terf:temp args set value {arg1:'execute if predicate datapipes_lib:chances/',arg3:' run playsound terf:geiger_counter.tick_lvl2 player @a[distance=0..] ~ ~ ~ 0.5 1'}
execute store result storage terf:temp args.arg2 int 2 run scoreboard players get temp terf_states
execute if predicate datapipes_lib:chances/50 run function datapipes_lib:require/with_args/3 with storage terf:temp args
scoreboard players remove temp terf_states 10

##
data modify storage terf:temp args set value {arg1:'execute if predicate datapipes_lib:chances/',arg3:' run playsound terf:geiger_counter.tick_lvl3 player @a[distance=0..] ~ ~ ~ 0.5 1'}
execute store result storage terf:temp args.arg2 int 2 run scoreboard players get temp terf_states
execute if predicate datapipes_lib:chances/50 run function datapipes_lib:require/with_args/3 with storage terf:temp args
scoreboard players remove temp terf_states 10

##
data modify storage terf:temp args set value {arg1:'execute if predicate datapipes_lib:chances/',arg3:' run playsound terf:geiger_counter.tick_lvl4 player @a[distance=0..] ~ ~ ~ 0.5 1'}
execute store result storage terf:temp args.arg2 int 1 run scoreboard players get temp terf_states
execute if predicate datapipes_lib:chances/50 run function datapipes_lib:require/with_args/3 with storage terf:temp args
scoreboard players remove temp terf_states 20

##
data modify storage terf:temp args set value {arg1:'execute if predicate datapipes_lib:chances/',arg3:' run playsound terf:geiger_counter.tick_lvl5 player @a[distance=0..] ~ ~ ~ 0.5 1'}
execute store result storage terf:temp args.arg2 int 1 run scoreboard players get temp terf_states
execute if predicate datapipes_lib:chances/50 run function datapipes_lib:require/with_args/3 with storage terf:temp args
scoreboard players remove temp terf_states 30

##
data modify storage terf:temp args set value {arg1:'execute if predicate datapipes_lib:chances/',arg3:' run playsound terf:geiger_counter.tick_lvl6 player @a[distance=0..] ~ ~ ~ 0.5 1'}
execute store result storage terf:temp args.arg2 int 1 run scoreboard players get temp terf_states
execute if predicate datapipes_lib:chances/50 run function datapipes_lib:require/with_args/3 with storage terf:temp args
scoreboard players remove temp terf_states 30

##
data modify storage terf:temp args set value {arg1:'execute if predicate datapipes_lib:chances/',arg3:' run playsound terf:geiger_counter.tick_lvl7 player @a[distance=0..] ~ ~ ~ 0.5 1'}
execute store result storage terf:temp args.arg2 int 1 run scoreboard players get temp terf_states
execute if predicate datapipes_lib:chances/50 run function datapipes_lib:require/with_args/3 with storage terf:temp args
scoreboard players remove temp terf_states 30

##
data modify storage terf:temp args set value {arg1:'execute if predicate datapipes_lib:chances/',arg3:' run playsound terf:geiger_counter.tick_lvl8 player @a[distance=0..] ~ ~ ~ 0.5 1'}
execute store result storage terf:temp args.arg2 int 1 run scoreboard players get temp terf_states
execute if predicate datapipes_lib:chances/50 run function datapipes_lib:require/with_args/3 with storage terf:temp args
scoreboard players remove temp terf_states 30

##
