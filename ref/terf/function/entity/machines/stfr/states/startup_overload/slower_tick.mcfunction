scoreboard players set stab1powered terf_states 0
scoreboard players set stab2powered terf_states 0
scoreboard players set stab3powered terf_states 0
scoreboard players set stab4powered terf_states 0
scoreboard players set stab5powered terf_states 0
scoreboard players set stab6powered terf_states 0

data modify storage terf:temp args set value {arg1:'execute as @e[type=minecraft:marker,tag=terf_stfr_so_helper,tag=terf_related_',arg3:'] run function terf:entity/machines/stfr/states/startup_overload/as_power_markers'}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/3 with storage terf:temp args

execute as @s[tag=!terf_stab1] run scoreboard players set stab1powered terf_states 0
execute as @s[tag=!terf_stab2] run scoreboard players set stab2powered terf_states 0
execute as @s[tag=!terf_stab3] run scoreboard players set stab3powered terf_states 0
execute as @s[tag=!terf_stab4] run scoreboard players set stab4powered terf_states 0
execute as @s[tag=!terf_stab5] run scoreboard players set stab5powered terf_states 0
execute as @s[tag=!terf_stab6] run scoreboard players set stab6powered terf_states 0

scoreboard players set stabs_powered terf_states 0
execute if score stab1powered terf_states matches 1 run scoreboard players add stabs_powered terf_states 1
execute if score stab2powered terf_states matches 1 run scoreboard players add stabs_powered terf_states 1
execute if score stab3powered terf_states matches 1 run scoreboard players add stabs_powered terf_states 1
execute if score stab4powered terf_states matches 1 run scoreboard players add stabs_powered terf_states 1
execute if score stab5powered terf_states matches 1 run scoreboard players add stabs_powered terf_states 1
execute if score stab6powered terf_states matches 1 run scoreboard players add stabs_powered terf_states 1

execute as @s[tag=!terf_bcd_s1p] if score stab1powered terf_states matches 1 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.startup_overload.stab1_connected',level:1,text:'{"text":"Stabilizer U connected! ","color":"green"},{"score":{"name":"stabs_powered","objective":"terf_states"},"color":"green"},{"text":"/4","color":"green"}'}
execute as @s[tag=terf_bcd_s1p] if score stab1powered terf_states matches 0 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.startup_overload.stab1_disconnected',level:1,text:'{"text":"Stabilizer U disconnected! ","color":"yellow"},{"score":{"name":"stabs_powered","objective":"terf_states"},"color":"yellow"},{"text":"/4","color":"yellow"}'}
execute if score stab1powered terf_states matches 1 run tag @s add terf_bcd_s1p
execute if score stab1powered terf_states matches 0 run tag @s remove terf_bcd_s1p

execute as @s[tag=!terf_bcd_s2p] if score stab2powered terf_states matches 1 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.startup_overload.stab2_connected',level:1,text:'{"text":"Stabilizer S connected! ","color":"green"},{"score":{"name":"stabs_powered","objective":"terf_states"},"color":"green"},{"text":"/4","color":"green"}'}
execute as @s[tag=terf_bcd_s2p] if score stab2powered terf_states matches 0 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.startup_overload.stab2_disconnected',level:1,text:'{"text":"Stabilizer S disconnected! ","color":"yellow"},{"score":{"name":"stabs_powered","objective":"terf_states"},"color":"yellow"},{"text":"/4","color":"yellow"}'}
execute if score stab2powered terf_states matches 1 run tag @s add terf_bcd_s2p
execute if score stab2powered terf_states matches 0 run tag @s remove terf_bcd_s2p

execute as @s[tag=!terf_bcd_s3p] if score stab3powered terf_states matches 1 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.startup_overload.stab3_connected',level:1,text:'{"text":"Stabilizer E connected! ","color":"green"},{"score":{"name":"stabs_powered","objective":"terf_states"},"color":"green"},{"text":"/4","color":"green"}'}
execute as @s[tag=terf_bcd_s3p] if score stab3powered terf_states matches 0 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.startup_overload.stab3_disconnected',level:1,text:'{"text":"Stabilizer E disconnected! ","color":"yellow"},{"score":{"name":"stabs_powered","objective":"terf_states"},"color":"yellow"},{"text":"/4","color":"yellow"}'}
execute if score stab3powered terf_states matches 1 run tag @s add terf_bcd_s3p
execute if score stab3powered terf_states matches 0 run tag @s remove terf_bcd_s3p

execute as @s[tag=!terf_bcd_s4p] if score stab4powered terf_states matches 1 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.startup_overload.stab4_connected',level:1,text:'{"text":"Stabilizer N connected! ","color":"green"},{"score":{"name":"stabs_powered","objective":"terf_states"},"color":"green"},{"text":"/4","color":"green"}'}
execute as @s[tag=terf_bcd_s4p] if score stab4powered terf_states matches 0 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.startup_overload.stab4_disconnected',level:1,text:'{"text":"Stabilizer N disconnected! ","color":"yellow"},{"score":{"name":"stabs_powered","objective":"terf_states"},"color":"yellow"},{"text":"/4","color":"yellow"}'}
execute if score stab4powered terf_states matches 1 run tag @s add terf_bcd_s4p
execute if score stab4powered terf_states matches 0 run tag @s remove terf_bcd_s4p

execute as @s[tag=!terf_bcd_s5p] if score stab5powered terf_states matches 1 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.startup_overload.stab5_connected',level:1,text:'{"text":"Stabilizer W connected! ","color":"green"},{"score":{"name":"stabs_powered","objective":"terf_states"},"color":"green"},{"text":"/4","color":"green"}'}
execute as @s[tag=terf_bcd_s5p] if score stab5powered terf_states matches 0 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.startup_overload.stab5_disconnected',level:1,text:'{"text":"Stabilizer W disconnected! ","color":"yellow"},{"score":{"name":"stabs_powered","objective":"terf_states"},"color":"yellow"},{"text":"/4","color":"yellow"}'}
execute if score stab5powered terf_states matches 1 run tag @s add terf_bcd_s5p
execute if score stab5powered terf_states matches 0 run tag @s remove terf_bcd_s5p

execute as @s[tag=!terf_bcd_s6p] if score stab6powered terf_states matches 1 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.startup_overload.stab6_connected',level:1,text:'{"text":"Stabilizer D connected! ","color":"green"},{"score":{"name":"stabs_powered","objective":"terf_states"},"color":"green"},{"text":"/4","color":"green"}'}
execute as @s[tag=terf_bcd_s6p] if score stab6powered terf_states matches 0 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.startup_overload.stab6_disconnected',level:1,text:'{"text":"Stabilizer D disconnected! ","color":"yellow"},{"score":{"name":"stabs_powered","objective":"terf_states"},"color":"yellow"},{"text":"/4","color":"yellow"}'}
execute if score stab6powered terf_states matches 1 run tag @s add terf_bcd_s6p
execute if score stab6powered terf_states matches 0 run tag @s remove terf_bcd_s6p

scoreboard players operation @s terf_data_Ab = stabs_powered terf_states

execute if score stabs_powered terf_states matches 4.. run function terf:entity/machines/stfr/states/startup_overload/restabilization_start