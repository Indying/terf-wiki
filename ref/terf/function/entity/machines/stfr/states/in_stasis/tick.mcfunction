#override control panel text
data modify storage terf:temp displays.group_main[1].messages[1] set value {"text":"⚠OUTR FAIL⚠","color":"dark_red"}

function terf:autokick

scoreboard players set spin_slow_adder terf_states 60000
function terf:entity/machines/stfr/calculations/tick
function terf:entity/machines/stfr/case_fire

scoreboard players add @s terf_data_E 1
execute if score @s terf_data_B matches ..10000 run scoreboard players add @s terf_data_B 90

#process visuals for this state
scoreboard players set shield_status terf_states 4
scoreboard players set stabilizer_rotation_duration terf_states 3
data modify storage terf:temp displays.group_main[].color set value "red"
function terf:entity/machines/stfr/visuals/stabilizer/stabilizer_power_beam_tick
function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step
function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step
function terf:entity/machines/stfr/visuals/stabilizer/rotation/rotate_stabilizers with entity @s data.terf
function terf:entity/machines/stfr/visuals/shield/tick

execute if score @s terf_data_E matches 810.. unless score working_stabs terf_states matches 0 run function terf:entity/machines/stfr/states/in_stasis/restabilize
execute if score @s terf_data_E matches 810.. if score working_stabs terf_states matches 0 run function terf:entity/machines/stfr/states/in_stasis/failure

#process sounds for this state
function terf:entity/machines/stfr/sound/humming_tick
function terf:entity/machines/stfr/sound/system_noise_tick
playsound minecraft:block.beacon.power_select master @a[distance=0..] ~ ~ ~ 10000 2

particle minecraft:soul_fire_flame ~ ~ ~ 0.4 0.4 0.4 0.06 100 force
execute if score mssr terf_states matches 0 run particle minecraft:large_smoke ~ ~ ~ 0.4 0.4 0.4 1 100 force
particle minecraft:large_smoke ~ ~ ~ 0.5 0.5 0.5 0.01 10 force
particle flash{color:[1,1,1,1]} ~ ~ ~ 1 1 1 0 1 force
playsound minecraft:entity.zombie_villager.converted master @a[distance=0..] ~ ~ ~ 5 2
execute if score @s terf_data_M matches 25000000.. run scoreboard players remove @s terf_data_M 5216375
execute if score @s terf_data_P matches 13467430.. run scoreboard players remove @s terf_data_P 13467430
