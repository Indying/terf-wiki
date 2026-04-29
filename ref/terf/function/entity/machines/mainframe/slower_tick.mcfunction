scoreboard players set @s terf_data_A 0
function terf:entity/machines/mainframe/fill_checks_on
function terf:entity/machines/mainframe/fill_checks_off
setblock ~ ~ ~ minecraft:lodestone
execute unless score @s terf_data_G matches 1.. positioned ~ ~-1 ~ run function terf:entity/machines/mainframe/logic_cable_checks

function terf:entity/machines/mainframe/gui/update