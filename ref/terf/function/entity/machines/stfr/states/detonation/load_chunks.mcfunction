$scoreboard players set temp terf_states -$(radius)
$scoreboard players set temp2 terf_states -$(radius)
$scoreboard players set radius terf_states $(radius)
$scoreboard players set temp3 terf_states $(load)
$execute positioned ~-$(radius) ~ ~-$(radius) run function terf:entity/machines/stfr/states/detonation/at_chunks with storage terf:temp args