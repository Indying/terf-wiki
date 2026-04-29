#move up
scoreboard players remove @s terf_data_D 500000
function terf:entity/machines/assembler/visuals_tick with entity @s data.terf

execute unless score @s terf_data_D matches ..-4000000 run return fail
#complete the recipe and reset the machine

fill ^4 ^5 ^3 ^-3 ^ ^-4 air replace barrier
scoreboard players set @s terf_data_A 0
scoreboard players set @s terf_data_D 0
function terf:entity/machines/assembler/transform_off with entity @s data.terf
stopsound @a[distance=..32] * terf:elevator_start
playsound terf:elevator_stop master @a[distance=0..] ~ ~ ~ 2 0
$kill @e[tag=terf_assembler_start_entity,tag=terf_related_$(machine_id)]
$$(z)
data merge block ^-2 ^1 ^5 {front_text:{has_glowing_text:1b,messages:[{text:"    Assembler    ",color:"yellow",underlined:1b},"",{text:"Complete!",color:green},""]},is_waxed:1b}
