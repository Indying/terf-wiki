#scoreboard players set @s terf_data_Ae 0

scoreboard players operation temp terf_states = core_temp_divided terf_states
scoreboard players add temp terf_states 50000
execute if score temp terf_states matches ..-1 run scoreboard players set temp terf_states 0
data modify storage terf:temp args.arg1 set value "playsound terf:reactor_humming ambient @a[distance=0..] ~ ~ ~ 3 "
execute if score temp terf_states matches 200001.. run data modify storage terf:temp args.arg1 set value "playsound terf:reactor_humming_2 ambient @a[distance=0..] ~ ~ ~ 3 "
execute if score temp terf_states matches 200001.. run scoreboard players remove temp terf_states 150000
execute if score temp terf_states matches 200001.. run scoreboard players set temp terf_states 200000

execute store result storage terf:temp args.arg2 double 0.00001 run scoreboard players get temp terf_states

function datapipes_lib:require/with_args/2 with storage terf:temp args