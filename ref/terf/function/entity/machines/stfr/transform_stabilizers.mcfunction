summon minecraft:item_display ~ ~ ~-9 {Rotation:[90.0f,0.0f],Tags:["terf_stab_rotor","terf_stab_w_rotor","terf_currententity"],item:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:7921031},Count:1b}}
summon minecraft:item_display ~9 ~ ~ {Rotation:[180.0f,0.0f],Tags:["terf_stab_rotor","terf_stab_e_rotor","terf_currententity"],item:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:7921031},Count:1b}}
summon minecraft:item_display ~ ~ ~9 {Rotation:[270.0f,0.0f],Tags:["terf_stab_rotor","terf_stab_s_rotor","terf_currententity"],item:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:7921031},Count:1b}}

data modify storage terf:temp args set value {arg1:"tag @e[type=minecraft:item_display,tag=terf_stab_rotor,tag=terf_currententity] add terf_related_"}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/2 with storage terf:temp args

tag @e remove terf_currententity

