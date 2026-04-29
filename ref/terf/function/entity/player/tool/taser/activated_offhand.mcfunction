execute if function terf:require/is_item_broken_offhand run return fail
tag @s add terf_currententity
scoreboard players add @s terf_data_G 30
playsound terf:taser player @a[distance=0..] ~ ~ ~ 1 1

particle minecraft:electric_spark ^.28 ^-.15 ^.2 0 0 0 0 1 force @s
item modify entity @s[gamemode=!creative] weapon.offhand {"function":"minecraft:set_damage","damage":-0.005,"add":true}

scoreboard players set temp terf_states 10
function terf:entity/player/tool/taser/raycast
tag @s remove terf_currententity