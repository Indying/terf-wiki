execute store result score temp terf_states run random value 1..10
execute unless score @s terf_data_F matches 1.. run scoreboard players set temp terf_states 0
execute if score temp terf_states matches 7.. run function terf:entity/black_hole/summon_late
execute unless score temp terf_states matches 7.. as @e[type=!item,distance=..20] run damage @s 2346 minecraft:explosion
execute unless score temp terf_states matches 7.. run function terf:entity/explosion/large_explosion/summon
stopsound @a[distance=..160] * terf:charge_up.rocketlaunch
function terf:entity/machines/multiblock_core_destroy