#turn on stabilizers
function terf:entity/machines/stfr/stabilizers_on
tag @s add terf_stab1
tag @s add terf_stab2
tag @s add terf_stab3
tag @s add terf_stab4
tag @s add terf_stab5
tag @s add terf_stab6
tag @s add terf_breakers_activated
tag @s add terf_core_online

#add capsules
data modify entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item set value {components: {"minecraft:custom_model_data": {floats: [5.0f], colors: [6908265]}, "minecraft:item_name": "Pressurized Capsule", "minecraft:item_model": "terf:tool/pressurized_capsule", "minecraft:lore": [{color: "#2A64EF", extra: [": 100000mb / 100000mb"], text: "Deuterium", italic: 0b}], "minecraft:custom_data": {terf: {capsule_contents: [], click_offhand: "", click: "terf:entity/player/tool/capsule/activated"}, id: "terf:pressurized_capsule", fluids: [{amount: 100000, max: 100000, id: "terf.deuterium"}]}, "minecraft:max_damage": 100000}, count: 1, id: "minecraft:carrot_on_a_stick"}
$execute as @e[type=interaction,tag=terf_receptacle,tag=terf_related_$(machine_id)] at @s run function terf:entity/receptacle/start_sliding_in
function terf:entity/machines/stfr/receptacles/make_injection_list with entity @s data.terf

#set controls
scoreboard players set @s terf_data_F 100
scoreboard players set @s terf_data_G 10
scoreboard players set @s terf_data_H 0
scoreboard players set @s terf_data_I 50
scoreboard players set @s terf_data_J 92
scoreboard players set @s terf_data_K 0
 
#set stats
scoreboard players set @s terf_data_A 3
scoreboard players set @s terf_data_B 10000
scoreboard players set @s terf_data_L 120000000
scoreboard players set @s terf_data_M 35000000
scoreboard players set @s terf_data_P 50000000

tellraw @a[distance=..128] [{"text":"["},{"text":"STFR:V3","color":"red"},{"text":"] "},{"text":"> "},"Instastarted."]

#add fuel
data modify entity @s data.terf.core_contents set value []
scoreboard players set injection_multiplier terf_states 60000
data modify storage terf:temp array set from entity @s data.terf.injection_list
function terf:entity/machines/stfr/calculations/iterate_injection_list with storage terf:temp array[0]

#coolant amount
data modify entity @s data.fluids[1].amount set value 1000000
data modify entity @s data.fluids[0].amount set value 0

#case pressure
function terf:entity/machines/stfr/calculations/tick
data modify entity @s data.terf.core_contents[].case_amount set value 2300000
