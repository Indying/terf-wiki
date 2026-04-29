function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.start.breakers_fail',level:0,text:'{"text":"Circuit breakers disengaged! ","color":"yellow"},{"text":"Please re-engage system breakers to continue reactor startup."}'}
tag @s remove terf_bcd_breakers

function terf:entity/machines/stfr/visuals/stabilizer/all_stab_rods_off

tag @s add terf_stab1_breach
tag @s add terf_stab2_breach
tag @s add terf_stab3_breach
tag @s add terf_stab4_breach
tag @s add terf_stab5_breach
tag @s add terf_stab6_breach
tag @s add terf_stab_pistons_breach
function terf:entity/machines/stfr/stabilizers_off

scoreboard players set @s terf_data_E 0