scoreboard players set @s terf_data_A 0
playsound minecraft:block.fire.extinguish block @a[distance=0..] ~ ~ ~ 1 2
$$(stored_recipe)
data remove entity @s data.terf.stored_recipe
execute at @s run function terf:entity/machines/fabricator/checks
