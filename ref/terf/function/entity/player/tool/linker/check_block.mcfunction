data remove storage terf:temp temp
data modify storage terf:temp temp.add.pos set value [I;0,0,0]
scoreboard players set raytermination terf_states 100

#get type of block
summon minecraft:item_display ~ ~ ~ {UUID:[I;488379,-385755,-141876,-44509]}
loot replace entity 000773bb-fffa-1d25-fffd-d5ccffff5223 hotbar.0 mine ~ ~ ~ diamond_pickaxe[enchantments={silk_touch:1}]
data modify storage terf:temp temp.fbss set from entity 000773bb-fffa-1d25-fffd-d5ccffff5223

#get players held item into the item display
item replace entity 000773bb-fffa-1d25-fffd-d5ccffff5223 container.0 from entity @s weapon

#add positions and id to an array
execute store result storage terf:temp temp.add.pos[0] int 1 run data get storage terf:temp temp.fbss.Pos[0] 1
execute store result storage terf:temp temp.add.pos[1] int 1 run data get storage terf:temp temp.fbss.Pos[1] 1
execute store result storage terf:temp temp.add.pos[2] int 1 run data get storage terf:temp temp.fbss.Pos[2] 1

#Remove the value from the array first to make sure it only has 1 of each coordinate
data modify storage terf:temp args set value {arg1:"execute store success score succeeded terf_states run data remove entity 000773bb-fffa-1d25-fffd-d5ccffff5223 item.components.minecraft:custom_data.terf.links.", arg3:"[{pos:[I;", arg5:",", arg7:",", arg9:"]}]"}
data modify storage terf:temp args.arg2 set from storage terf:temp temp.fbss.item.id
data modify storage terf:temp args.arg4 set from storage terf:temp temp.add.pos[0]
data modify storage terf:temp args.arg6 set from storage terf:temp temp.add.pos[1]
data modify storage terf:temp args.arg8 set from storage terf:temp temp.add.pos[2]
function datapipes_lib:require/with_args/9 with storage terf:temp args

#Add the value to the list
data modify storage terf:temp args set value {arg1:'data modify entity 000773bb-fffa-1d25-fffd-d5ccffff5223 item.components.minecraft:custom_data.terf.links.', arg3:' append from storage terf:temp temp.add'}
data modify storage terf:temp args.arg2 set from storage terf:temp temp.fbss.item.id
execute if score succeeded terf_states matches 0 run function datapipes_lib:require/with_args/3 with storage terf:temp args

execute if score succeeded terf_states matches 0 if block ~ ~ ~ lever run function terf:entity/machines/lamp_controller/turn_on_lever
execute if score succeeded terf_states matches 1 if block ~ ~ ~ lever run function terf:entity/machines/lamp_controller/turn_off_lever

#Update connected blocks amount
execute store result score temp terf_states run data get entity 000773bb-fffa-1d25-fffd-d5ccffff5223 item.components.minecraft:custom_data.terf.links.connected_blocks
execute if score succeeded terf_states matches 0 run scoreboard players add temp terf_states 1
execute if score succeeded terf_states matches 1 run scoreboard players remove temp terf_states 1
execute store result entity 000773bb-fffa-1d25-fffd-d5ccffff5223 item.components.minecraft:custom_data.terf.links.connected_blocks int 1 run scoreboard players get temp terf_states

data modify storage terf:temp args set value {arg1:'data modify entity 000773bb-fffa-1d25-fffd-d5ccffff5223 item.components.minecraft:lore[0] set value [{"text":"Links: ', arg3:'","italic":false,"color":"dark_gray"}]'}
execute store result storage terf:temp args.arg2 int 1 run scoreboard players get temp terf_states
function datapipes_lib:require/with_args/3 with storage terf:temp args

#Sound
execute if score succeeded terf_states matches 0 run playsound terf:alarms.toolbeep player @a[distance=0..] ~ ~ ~ 1 1
execute if score succeeded terf_states matches 1 run playsound terf:alarms.toolbeep player @a[distance=0..] ~ ~ ~ 1 0.8

#Chat message
execute if score succeeded terf_states matches 0 run data modify storage terf:temp args set value {arg1:'tellraw @s [{"text":"["},{"text":"Linker","color":"light_purple"},{"text":"]"}," #', arg3:' Added ",{"text":"',arg5:'","color":"aqua"}," at ', arg7:" ", arg9:" ", arg11:'"]'}
execute if score succeeded terf_states matches 1 run data modify storage terf:temp args set value {arg1:'tellraw @s [{"text":"["},{"text":"Linker","color":"light_purple"},{"text":"]"}," #', arg3:' Removed ",{"text":"',arg5:'","color":"aqua"}," at ', arg7:" ", arg9:" ", arg11:'"]'}

data modify storage terf:temp args2 set value {arg1:'execute store result storage terf:temp args.arg2 int 1 run data get entity 000773bb-fffa-1d25-fffd-d5ccffff5223 item.components.minecraft:custom_data.terf.links.'}
data modify storage terf:temp args2.arg2 set from storage terf:temp temp.fbss.item.id
function datapipes_lib:require/with_args/2 with storage terf:temp args2

data modify storage terf:temp args.arg4 set from storage terf:temp temp.fbss.item.id
data modify storage terf:temp args.arg6 set from storage terf:temp temp.add.pos[0]
data modify storage terf:temp args.arg8 set from storage terf:temp temp.add.pos[1]
data modify storage terf:temp args.arg10 set from storage terf:temp temp.add.pos[2]
function datapipes_lib:require/with_args/11 with storage terf:temp args

#set players held item into the item display
item replace entity @s weapon from entity 000773bb-fffa-1d25-fffd-d5ccffff5223 container.0

kill 000773bb-fffa-1d25-fffd-d5ccffff5223

scoreboard players set block_found terf_states 1
particle minecraft:electric_spark ~ ~.5 ~ 1 0 0 0 100 force
particle minecraft:electric_spark ~ ~.5 ~ 0 1 0 0 100 force
particle minecraft:electric_spark ~ ~.5 ~ 0 0 1 0 100 force
