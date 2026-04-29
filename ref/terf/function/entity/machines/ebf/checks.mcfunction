#fail if no items
execute unless items block ~ ~ ~ container.4 * run return fail

#fail if no power
execute if score @s datapipes_lib_power_storage matches ..0 run return fail

#fail if structure broken
scoreboard players set succeeded terf_states 0
execute if block ^1 ^ ^ waxed_oxidized_copper \
if block ^ ^ ^ crafter \
if block ^-1 ^ ^ waxed_oxidized_copper \
if block ^1 ^ ^-1 dropper \
if block ^ ^ ^-1 waxed_oxidized_copper \
if block ^-1 ^ ^-1 waxed_oxidized_copper \
if block ^1 ^ ^-2 waxed_oxidized_copper \
if block ^ ^ ^-2 granite_slab[type=double] \
if block ^-1 ^ ^-2 waxed_oxidized_copper \
if block ^-1 ^3 ^-2 waxed_oxidized_copper \
if block ^ ^3 ^-2 waxed_oxidized_copper \
if block ^1 ^3 ^ waxed_oxidized_copper \
if block ^-1 ^3 ^ waxed_oxidized_copper \
if block ^1 ^3 ^-1 waxed_oxidized_copper \
if block ^ ^3 ^-1 dispenser[facing=up] \
if block ^-1 ^3 ^-1 waxed_oxidized_copper \
if block ^1 ^3 ^-2 waxed_oxidized_copper \
if block ^ ^3 ^-2 waxed_oxidized_copper \
if block ^-1 ^3 ^-2 waxed_oxidized_copper \
if block ^1 ^1 ^ petrified_oak_slab[type=double] \
if block ^ ^1 ^ petrified_oak_slab[type=double] \
if block ^-1 ^1 ^ petrified_oak_slab[type=double] \
if block ^1 ^1 ^-1 petrified_oak_slab[type=double] \
if block ^-1 ^1 ^-1 petrified_oak_slab[type=double] \
if block ^1 ^1 ^-2 petrified_oak_slab[type=double] \
if block ^ ^1 ^-2 petrified_oak_slab[type=double] \
if block ^-1 ^1 ^-2 petrified_oak_slab[type=double] \
if block ^1 ^2 ^ petrified_oak_slab[type=double] \
if block ^ ^2 ^ petrified_oak_slab[type=double] \
if block ^-1 ^2 ^ petrified_oak_slab[type=double] \
if block ^1 ^2 ^-1 petrified_oak_slab[type=double] \
if block ^-1 ^2 ^-1 petrified_oak_slab[type=double] \
if block ^1 ^2 ^-2 petrified_oak_slab[type=double] \
if block ^ ^2 ^-2 petrified_oak_slab[type=double] \
if block ^-1 ^2 ^-2 petrified_oak_slab[type=double] \
run scoreboard players set succeeded terf_states 1
execute if score succeeded terf_states matches 0 run return fail

#get recipe from storage
data modify storage terf:temp args2 set value {name:"ebf",a:"z"}
data modify storage terf:temp args2.a set from block ~ ~ ~ Items[{Slot:4b}].id
data modify storage terf:temp args2.a set from block ~ ~ ~ Items[{Slot:4b}].components.minecraft:custom_data.id

function terf:require/read_1_recipes with storage terf:temp args2

#fail if no valid recipe
execute unless data storage terf:temp output.z run return fail

#start the machine
data modify storage terf:temp args set from entity @s data.terf
execute unless data entity @s data.terf.stored_recipe positioned ^ ^1.5 ^-1 summon item_display run function terf:entity/machines/ebf/as_item_display with storage terf:temp args

data modify entity @s data.terf.stored_recipe set from storage terf:temp output.z
item modify block ~ ~ ~ container.4 datapipes_lib:decrement_item
execute store result score @s terf_data_A run data get storage terf:temp output.t
