scoreboard players set index terf_states 0

data modify storage datapipes_lib:temp args.array set from block ~ ~-1 ~ Items[0].components.minecraft:custom_data.terf.links.minecraft:lever
data modify storage terf:temp args.array set from storage datapipes_lib:temp args.array 
data modify storage datapipes_lib:temp args.command set value "function terf:test/as_array_value"

function datapipes_lib:require/as_all_array_values with storage datapipes_lib:temp args

data modify block ~ ~-1 ~ Items[0].components.minecraft:custom_data.terf.links.minecraft:lever set from storage terf:temp args.array

################################################################################################################################################
scoreboard players set index terf_states 0

data modify storage datapipes_lib:temp args.array set from block ~ ~-1 ~ Items[0].components.minecraft:custom_data.terf.links.minecraft:dark_oak_button
data modify storage terf:temp args.array set from storage datapipes_lib:temp args.array 
data modify storage datapipes_lib:temp args.command set value "function terf:test/as_array_value"

function datapipes_lib:require/as_all_array_values with storage datapipes_lib:temp args

data modify block ~ ~-1 ~ Items[0].components.minecraft:custom_data.terf.links.minecraft:dark_oak_button set from storage terf:temp args.array

################################################################################################################################################
scoreboard players set index terf_states 0

data modify storage datapipes_lib:temp args.array set from block ~ ~-1 ~ Items[0].components.minecraft:custom_data.terf.links.minecraft:stone_button
data modify storage terf:temp args.array set from storage datapipes_lib:temp args.array 
data modify storage datapipes_lib:temp args.command set value "function terf:test/as_array_value"

function datapipes_lib:require/as_all_array_values with storage datapipes_lib:temp args

data modify block ~ ~-1 ~ Items[0].components.minecraft:custom_data.terf.links.minecraft:stone_button set from storage terf:temp args.array

################################################################################################################################################
scoreboard players set index terf_states 0

data modify storage datapipes_lib:temp args.array set from block ~ ~-1 ~ Items[0].components.minecraft:custom_data.terf.links.minecraft:polished_blackstone_button
data modify storage terf:temp args.array set from storage datapipes_lib:temp args.array 
data modify storage datapipes_lib:temp args.command set value "function terf:test/as_array_value"

function datapipes_lib:require/as_all_array_values with storage datapipes_lib:temp args

data modify block ~ ~-1 ~ Items[0].components.minecraft:custom_data.terf.links.minecraft:polished_blackstone_button set from storage terf:temp args.array

################################################################################################################################################
