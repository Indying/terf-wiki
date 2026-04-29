execute if score @s terf_data_A matches 17 run return fail

execute if score case_pressure_divided terf_states matches 150.. positioned ~-14 ~-14 ~-14 as @a[dx=28,dy=28,dz=28] run scoreboard players add @s terf_data_A 19
scoreboard players add @a[distance=..30] terf_data_A 3

#scoreboard players operation temp terf_states = @s terf_data_O
#scoreboard players operation temp terf_states /= stfr_case_pressure_remove_rate_divider terf_states
#scoreboard players operation @s terf_data_O -= temp terf_states

scoreboard players operation pitch terf_states = case_pressure_divided terf_states
scoreboard players add pitch terf_states 30000
execute if score pitch terf_states matches 60000.. run scoreboard players set pitch terf_states 59999
execute if score pitch terf_states matches ..29999 run scoreboard players set pitch terf_states 30000

scoreboard players operation volume terf_states = case_pressure_divided terf_states
execute if score volume terf_states matches 10000.. run scoreboard players set volume terf_states 9999
scoreboard players add volume terf_states 1000

data modify storage terf:temp args set value {arg1:'playsound minecraft:entity.player.breath block @a[distance=0..] ~ ~ ~ ',arg3:' '}
execute store result storage terf:temp args.arg2 double 0.0008 run scoreboard players get volume terf_states
execute store result storage terf:temp args.arg4 double 0.00003333 run scoreboard players get pitch terf_states
function datapipes_lib:require/with_args/4 with storage terf:temp args

scoreboard players remove pitch terf_states 26000

data modify storage terf:temp args set value {arg1:'particle poof ~ ~ ~ 0.5 0.5 0.5 ',arg3:' '}
execute store result storage terf:temp args.arg2 float 0.0001 run scoreboard players get pitch terf_states
scoreboard players remove pitch terf_states 3800
execute store result storage terf:temp args.arg4 int 0.005 run scoreboard players get pitch terf_states
function datapipes_lib:require/with_args/4 with storage terf:temp args

scoreboard players operation temp terf_states = core_temp_divided terf_states
scoreboard players operation temp terf_states /= 6 terf_states
execute facing entity @a[distance=..30,limit=1,sort=nearest] eyes run function terf:entity/machines/stfr/radiation_raycast