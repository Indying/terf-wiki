particle minecraft:electric_spark ~.5 ~3.5 ~.5 1 0.2 1 1 20 force
$execute positioned ~ ~4.5 ~ run particle minecraft:electric_spark ~.5 ~$(height) ~.5 1 0.2 1 1 20 force

$execute if data entity @s data.terf.stored_item positioned ~ ~4 ~ run particle minecraft:electric_spark ~.5 ~$(half_height) ~.5 0.2 3 0.2 0.5 10 force

$execute if score @s terf_data_D matches 3 positioned ~ ~4 ~ run particle minecraft:electric_spark ~.5 ~$(half_height) ~.5 0.1 0.1 0.1 0 100 force
$execute if score @s terf_data_D matches 3 positioned ~ ~4 ~ run particle minecraft:electric_spark ~.5 ~$(half_height) ~.5 0.2 2 0.2 0.5 10 force
