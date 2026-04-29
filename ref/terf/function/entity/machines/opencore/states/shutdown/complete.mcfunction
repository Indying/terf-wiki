$execute positioned ~.5 ~6 ~.5 run $(z)
particle minecraft:firework ~.5 ~6 ~.5 0 0 0 0.1 100 force
data remove entity @s data.terf.stored_recipe 
particle minecraft:smoke ~.5 ~ ~.5 0 0 0 0.1 100 force

scoreboard players set @s terf_data_G 22
scoreboard players set @s terf_data_D 0
scoreboard players set @s terf_data_E 0

function terf:entity/machines/opencore/visuals/coil_steam
