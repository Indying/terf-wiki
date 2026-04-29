execute unless block ^ ^2 ^1 #terf:redstoneactive[powered=true] unless block ^ ^2 ^1 #terf:redstoneactive[lit=true] run return fail
execute unless score @s datapipes_lib_power_storage matches 1.. run return fail

#automation mode
scoreboard players set automation_mode terf_states 0
execute if block ^ ^2 ^1 #terf:redstoneactive[lit=true] run scoreboard players set automation_mode terf_states 1
execute if score automation_mode terf_states matches 1 if items block ~ ~ ~ container.0 *[minecraft:count=1] run return fail
execute if score automation_mode terf_states matches 1 if items block ~ ~ ~ container.1 *[minecraft:count=1] run return fail
execute if score automation_mode terf_states matches 1 if items block ~ ~ ~ container.2 *[minecraft:count=1] run return fail
execute if score automation_mode terf_states matches 1 if items block ~ ~ ~ container.3 *[minecraft:count=1] run return fail
execute if score automation_mode terf_states matches 1 if items block ~ ~ ~ container.4 *[minecraft:count=1] run return fail
execute if score automation_mode terf_states matches 1 if items block ~ ~ ~ container.5 *[minecraft:count=1] run return fail
execute if score automation_mode terf_states matches 1 if items block ~ ~ ~ container.6 *[minecraft:count=1] run return fail
execute if score automation_mode terf_states matches 1 if items block ~ ~ ~ container.7 *[minecraft:count=1] run return fail
execute if score automation_mode terf_states matches 1 if items block ~ ~ ~ container.8 *[minecraft:count=1] run return fail

#recipe checks
data modify storage terf:temp args2 set value {name:"fabricator",a:"z",b:"z",c:"z",d:"z",e:"z",f:"z",g:"z",h:"z",i:"z"}

data modify storage terf:temp items set from block ~ ~ ~ Items

data modify storage terf:temp args2.a set from storage terf:temp items[{Slot:0b}].id
data modify storage terf:temp args2.a set from storage terf:temp items[{Slot:0b}].components.minecraft:custom_data.id
data modify storage terf:temp args2.b set from storage terf:temp items[{Slot:1b}].id
data modify storage terf:temp args2.b set from storage terf:temp items[{Slot:1b}].components.minecraft:custom_data.id
data modify storage terf:temp args2.c set from storage terf:temp items[{Slot:2b}].id
data modify storage terf:temp args2.c set from storage terf:temp items[{Slot:2b}].components.minecraft:custom_data.id
data modify storage terf:temp args2.d set from storage terf:temp items[{Slot:3b}].id
data modify storage terf:temp args2.d set from storage terf:temp items[{Slot:3b}].components.minecraft:custom_data.id
data modify storage terf:temp args2.e set from storage terf:temp items[{Slot:4b}].id
data modify storage terf:temp args2.e set from storage terf:temp items[{Slot:4b}].components.minecraft:custom_data.id
data modify storage terf:temp args2.f set from storage terf:temp items[{Slot:5b}].id
data modify storage terf:temp args2.f set from storage terf:temp items[{Slot:5b}].components.minecraft:custom_data.id
data modify storage terf:temp args2.g set from storage terf:temp items[{Slot:6b}].id
data modify storage terf:temp args2.g set from storage terf:temp items[{Slot:6b}].components.minecraft:custom_data.id
data modify storage terf:temp args2.h set from storage terf:temp items[{Slot:7b}].id
data modify storage terf:temp args2.h set from storage terf:temp items[{Slot:7b}].components.minecraft:custom_data.id
data modify storage terf:temp args2.i set from storage terf:temp items[{Slot:8b}].id
data modify storage terf:temp args2.i set from storage terf:temp items[{Slot:8b}].components.minecraft:custom_data.id

function terf:require/read_9_recipes with storage terf:temp args2

execute if data storage terf:temp output.z run function terf:entity/machines/fabricator/activated
