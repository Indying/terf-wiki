execute on attacker at @s in terf:intermediary_technical_storage_dimension positioned 0. 0 0. run tp 0010eff0-0010-effa-0010-cd370010c94e ^ ^ ^1
data modify storage datapipes_lib:temp temp set from entity 0010eff0-0010-effa-0010-cd370010c94e Pos
execute store result score x terf_states run data get storage datapipes_lib:temp temp[0] 100
execute store result score y terf_states run data get storage datapipes_lib:temp temp[1] 100
execute store result score z terf_states run data get storage datapipes_lib:temp temp[2] 100
execute if score @s terf_data_X matches -500..500 run scoreboard players operation @s terf_data_X += x terf_states
execute if score @s terf_data_Y matches -500..500 run scoreboard players operation @s terf_data_Y += y terf_states
execute if score @s terf_data_Z matches -500..500 run scoreboard players operation @s terf_data_Z += z terf_states

#return unless the attacker is in creative mode or sneaking
execute on attacker if predicate datapipes_lib:pressing_sneak run return fail
execute on attacker unless entity @s[gamemode=creative] run return fail

#copy the components from the item display
execute on passengers run data modify storage terf:temp temp set from entity @s[type=item_display] item

execute store result score color terf_states run data get storage terf:temp temp.components.minecraft:custom_model_data.colors[0]
scoreboard players operation R terf_states = color terf_states
scoreboard players operation R terf_states /= 65536 terf_states
scoreboard players operation G terf_states = color terf_states
scoreboard players operation G terf_states /= 256 terf_states
scoreboard players operation G terf_states %= 256 terf_states
scoreboard players operation B terf_states = color terf_states
scoreboard players operation B terf_states %= 256 terf_states

execute store result storage terf:temp args.r int 1 run scoreboard players get R terf_states
execute store result storage terf:temp args.g int 1 run scoreboard players get G terf_states
execute store result storage terf:temp args.b int 1 run scoreboard players get B terf_states
function terf:require/rgb_to_hex with storage terf:temp args
execute store result storage terf:temp args.colorint int 1 run scoreboard players get color terf_states
execute store result storage terf:temp args.damage float 0.00005 run scoreboard players get @s terf_data_B
execute store result storage terf:temp args.charge float 0.00002 run scoreboard players get @s datapipes_lib_power_storage
function terf:entity/vehicle/hoverbike/seat_hit_args with storage terf:temp args

data modify storage terf:temp args set value {arg1:"summon item ~ ~ ~ {Item:",arg3:"}"}
data modify storage terf:temp args.arg2 set from storage terf:temp temp
function datapipes_lib:require/with_args/3 with storage terf:temp args

#remove the whole hoverbike
execute on passengers run kill @s[type=item_display]
kill @s
