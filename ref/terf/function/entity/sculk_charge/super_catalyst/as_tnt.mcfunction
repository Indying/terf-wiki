particle minecraft:sculk_charge_pop ~ ~.5 ~ 0.2 0.2 0.2 0.1 10 force

execute store result score temp terf_states run data get entity @s fuse
execute if score temp terf_states matches 2.. run return fail
playsound minecraft:entity.warden.sonic_boom block @a ~ ~ ~ 2 1
particle minecraft:sonic_boom ~ ~.5 ~ 2 2 2 0 20 force
particle minecraft:sculk_charge_pop ~ ~.5 ~ 0.2 0.2 0.2 1 100 force
kill @s