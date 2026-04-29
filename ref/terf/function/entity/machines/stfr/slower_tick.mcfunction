#power the lightning rods that turn the redstone lamps on within stabilizers
execute positioned ~6 ~ ~ run function datapipes_lib:require/lightning_rod_on
execute positioned ~-6 ~ ~ run function datapipes_lib:require/lightning_rod_on
execute positioned ~ ~6 ~ run function datapipes_lib:require/lightning_rod_on
execute positioned ~ ~-6 ~ run function datapipes_lib:require/lightning_rod_on
execute positioned ~ ~ ~6 run function datapipes_lib:require/lightning_rod_on
execute positioned ~ ~ ~-6 run function datapipes_lib:require/lightning_rod_on

tag @s remove terf_indestructible

#structure checks
execute unless score dev_mode terf_states matches 1 unless score @s terf_data_A matches 8 unless score @s terf_data_A matches 13 run function terf:entity/machines/stfr/structure_checks with entity @s data.terf

#mainframe update buffering
execute if score @s terf_connected_mainframe_buffer = @s terf_connected_mainframe_buffer run scoreboard players operation @s terf_connected_mainframe = @s terf_connected_mainframe_buffer
execute unless score @s terf_connected_mainframe_buffer = @s terf_connected_mainframe_buffer run scoreboard players reset @s terf_connected_mainframe
scoreboard players reset @s terf_connected_mainframe_buffer

#cooling system
execute as @s[tag=terf_stab4_core] if block ~ ~ ~-14 chiseled_quartz_block run data modify entity @s data.fluids[0] merge value {outpos:"~ ~ ~-14", checks:"if block ~ ~ ~-14 red_glazed_terracotta"}
execute as @s[tag=terf_stab2_core] if block ~ ~ ~14 chiseled_quartz_block run data modify entity @s data.fluids[0] merge value {outpos:"~ ~ ~14", checks:"if block ~ ~ ~14 red_glazed_terracotta"}
execute as @s[tag=terf_stab6_core] if block ~ ~-14 ~ chiseled_quartz_block run data modify entity @s data.fluids[0] merge value {outpos:"~ ~-14 ~", checks:"if block ~ ~-14 ~ red_glazed_terracotta"}
execute as @s[tag=terf_stab1_core] if block ~ ~14 ~ chiseled_quartz_block run data modify entity @s data.fluids[0] merge value {outpos:"~ ~14 ~", checks:"if block ~ ~14 ~ red_glazed_terracotta"}
execute as @s[tag=terf_stab5_core] if block ~-14 ~ ~ chiseled_quartz_block run data modify entity @s data.fluids[0] merge value {outpos:"~-14 ~ ~", checks:"if block ~-14 ~ ~ red_glazed_terracotta"}
execute as @s[tag=terf_stab3_core] if block ~14 ~ ~ chiseled_quartz_block run data modify entity @s data.fluids[0] merge value {outpos:"~14 ~ ~", checks:"if block ~14 ~ ~ red_glazed_terracotta"}

execute as @s[tag=terf_stab4_core] if block ~ ~ ~-14 smooth_basalt run data modify entity @s data.fluids[1] merge value {outpos:"~ ~ ~-14", checks:"if block ~ ~ ~-14 red_glazed_terracotta"}
execute as @s[tag=terf_stab2_core] if block ~ ~ ~14 smooth_basalt run data modify entity @s data.fluids[1] merge value {outpos:"~ ~ ~14", checks:"if block ~ ~ ~14 red_glazed_terracotta"}
execute as @s[tag=terf_stab6_core] if block ~ ~-14 ~ smooth_basalt run data modify entity @s data.fluids[1] merge value {outpos:"~ ~-14 ~", checks:"if block ~ ~-14 ~ red_glazed_terracotta"}
execute as @s[tag=terf_stab1_core] if block ~ ~14 ~ smooth_basalt run data modify entity @s data.fluids[1] merge value {outpos:"~ ~14 ~", checks:"if block ~ ~14 ~ red_glazed_terracotta"}
execute as @s[tag=terf_stab5_core] if block ~-14 ~ ~ smooth_basalt run data modify entity @s data.fluids[1] merge value {outpos:"~-14 ~ ~", checks:"if block ~-14 ~ ~ red_glazed_terracotta"}
execute as @s[tag=terf_stab3_core] if block ~14 ~ ~ smooth_basalt run data modify entity @s data.fluids[1] merge value {outpos:"~14 ~ ~", checks:"if block ~14 ~ ~ red_glazed_terracotta"}

execute as @s[tag=terf_stab4_core] if block ~ ~ ~-14 observer run data modify entity @s data.fluids[2] merge value {outpos:"~ ~ ~-14", checks:"positioned ~ ~ ~-14 if function terf:require/observer_fluid_checks"}
execute as @s[tag=terf_stab2_core] if block ~ ~ ~14 observer run data modify entity @s data.fluids[2] merge value {outpos:"~ ~ ~14", checks:"positioned ~ ~ ~14 if function terf:require/observer_fluid_checks"}
execute as @s[tag=terf_stab6_core] if block ~ ~-14 ~ observer run data modify entity @s data.fluids[2] merge value {outpos:"~ ~-14 ~", checks:"positioned ~ ~-14 ~ if function terf:require/observer_fluid_checks"}
execute as @s[tag=terf_stab1_core] if block ~ ~14 ~ observer run data modify entity @s data.fluids[2] merge value {outpos:"~ ~14 ~", checks:"positioned ~ ~14 ~ if function terf:require/observer_fluid_checks"}
execute as @s[tag=terf_stab5_core] if block ~-14 ~ ~ observer run data modify entity @s data.fluids[2] merge value {outpos:"~-14 ~ ~", checks:"positioned ~-14 ~ ~ if function terf:require/observer_fluid_checks"}
execute as @s[tag=terf_stab3_core] if block ~14 ~ ~ observer run data modify entity @s data.fluids[2] merge value {outpos:"~14 ~ ~", checks:"positioned ~14 ~ ~ if function terf:require/observer_fluid_checks"}

execute if score coolant_amount terf_states matches ..-1 run scoreboard players set coolant_amount terf_states 0

scoreboard players operation coolant_difference terf_states = @s terf_data_X
scoreboard players operation coolant_difference terf_states -= coolant_amount terf_states

scoreboard players operation coolant_usage terf_states = cooling_rate terf_states
scoreboard players operation coolant_usage terf_states /= 40 terf_states

tag @s remove terf_intake_leaking
execute if score cooling_rate terf_states matches 2.. if score coolant_usage terf_states matches 2.. if score coolant_difference terf_states >= coolant_usage terf_states run tag @s add terf_intake_leaking
execute if score coolant_amount terf_states matches 0 run tag @s add terf_intake_leaking

scoreboard players operation @s terf_data_X = coolant_amount terf_states