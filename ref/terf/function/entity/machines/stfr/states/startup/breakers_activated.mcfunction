function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.start.breakers',level:0,text:'{"text":"Circuit breakers engaged! "},{"text":"Awaiting control room core systems activation confirmation...","color":"yellow"}'}
tag @s add terf_bcd_breakers

tag @s remove terf_receptacles_locked

tag @s remove terf_stab1_breach
tag @s remove terf_stab2_breach
tag @s remove terf_stab3_breach
tag @s remove terf_stab4_breach
tag @s remove terf_stab5_breach
tag @s remove terf_stab6_breach
tag @s remove terf_stab_pistons_breach
function terf:entity/machines/stfr/stabilizers_on