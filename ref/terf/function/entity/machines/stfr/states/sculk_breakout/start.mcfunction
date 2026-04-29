scoreboard players set @s terf_data_A 14
scoreboard players set @s terf_data_E 0
tag @s add terf_core_online
function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:5,text:'{"text":"Unexpected Crystallization Detected In The Reactor\'s Fuel Supply!","color":"red"}'}