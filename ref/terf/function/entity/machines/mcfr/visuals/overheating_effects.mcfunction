#==================== text displays ====================
execute if entity @s[tag=!terf_has_text_displays] positioned ~ ~-.5 ~ run function terf:entity/machines/mcfr/visuals/summon_text_displays with entity @s data.terf

scoreboard players operation temp terf_states = core_temp_divided terf_states
scoreboard players remove temp terf_states 1000

#get blackbody color
data modify storage terf:temp args set value {arg1:'data modify storage terf:temp args.color set from storage terf:constants blackbody_hex.'}
execute store result storage terf:temp args.arg2 int 0.2 run scoreboard players get temp terf_states
function datapipes_lib:require/with_args/2 with storage terf:temp args

#calculate opacity
scoreboard players operation opacity terf_states = temp terf_states
scoreboard players operation opacity terf_states /= 20 terf_states
execute if score opacity terf_states matches ..-1 run scoreboard players set opacity terf_states 0
scoreboard players add opacity terf_states 26

$execute as @e[type=minecraft:text_display,tag=terf_related_$(machine_id)] run function terf:entity/machines/mcfr/visuals/as_text_displays

#==================== vent effects ====================
execute if score core_temp_divided terf_states matches 1000.. run function terf:entity/machines/mcfr/visuals/vent_particle {s:0.01,p:"smoke"}
execute if score core_temp_divided terf_states matches 1800.. run function terf:entity/machines/mcfr/visuals/vent_particle {s:0.02,p:"small_flame"}
execute if score core_temp_divided terf_states matches 3000.. run function terf:entity/machines/mcfr/visuals/vent_particle {s:0.01,p:"large_smoke"}
execute if score core_temp_divided terf_states matches 3000.. run function terf:entity/machines/mcfr/visuals/vent_particle {s:0.03,p:"flame"}

#==================== sound ====================
#crackling heat sound
scoreboard players operation chance terf_states = temp terf_states
scoreboard players operation chance terf_states *= temp terf_states

execute store result storage terf:temp args.chance float 0.0000000426178690929 run scoreboard players get chance terf_states
function terf:entity/machines/mcfr/visuals/crackling_heat_sound with storage terf:temp args

#==================== logic ====================
#explode at tungstens melting point
execute if score core_temp_divided terf_states matches 3422.. run function terf:entity/machines/mcfr/detonation/detonate_reactor
