$data modify storage terf:temp array[-1][-1] set from storage terf:constants fluid_dictionary.$(id).chem
execute store result score amount terf_states store result storage terf:temp args.amount int 1 run data get entity @s item.components.minecraft:custom_data.fluids[0].amount
function terf:entity/machines/stfr_control_panel/capsule_display/append_args with storage terf:temp args

execute if score amount terf_states < lowest_amount terf_states run scoreboard players operation lowest_amount terf_states = amount terf_states

execute if score amount terf_states matches 6000.. run return fail
data modify storage terf:temp array[-1][0].color set value yellow
execute if score amount terf_states matches ..3000 run data modify storage terf:temp array[-1][0].color set value red
scoreboard players remove working_systems terf_states 1