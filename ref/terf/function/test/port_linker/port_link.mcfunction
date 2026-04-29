data modify storage terf:temp test set value []
$data modify storage terf:temp test[0] set from block ~ ~ ~ Items[0].components.minecraft:custom_data.terf.links.minecraft:lever[$(slot)].pos[0]
$data modify storage terf:temp test[1] set from block ~ ~ ~ Items[0].components.minecraft:custom_data.terf.links.minecraft:lever[$(slot)].pos[1]
$data modify storage terf:temp test[2] set from block ~ ~ ~ Items[0].components.minecraft:custom_data.terf.links.minecraft:lever[$(slot)].pos[2]
$data modify block ~ ~ ~ Items[0].components.minecraft:custom_data.terf.links.minecraft:lever[$(slot)].pos set from storage terf:temp test

say ky