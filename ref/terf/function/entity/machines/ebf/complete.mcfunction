$execute positioned ^1 ^ ^-1 run $(stored_recipe)
function terf:entity/machines/ebf/checks
execute if score @s terf_data_A matches 1.. run return fail
$kill @e[type=item_display,tag=terf_related_$(machine_id)]
data remove entity @s data.terf.stored_recipe
