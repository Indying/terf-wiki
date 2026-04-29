execute if function terf:require/is_item_broken_offhand run return fail

scoreboard players add @s terf_data_G 4
playsound minecraft:entity.blaze.hurt player @a[distance=0..] ~ ~ ~ 1 2
scoreboard players set temp terf_states 600
tag @s add terf_currententity
execute positioned ^ ^-0.03 ^ run function terf:entity/player/tool/laser_pistol/raycast
tag @s remove terf_currententity

execute unless score @s terf_data_C matches 1 run item modify entity @s weapon.offhand {"function":"minecraft:set_damage","damage":-0.002,"add":true}
execute at @s run rotate @s ~ ~-0.5
