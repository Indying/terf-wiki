execute store result score @s terf_data_B run random value 1..8
execute if score @s terf_data_B matches 1 run summon minecraft:item_display ^.5 ^1.5 ^ {Tags:["terf_limbo","terf_limbo_hint"]}
execute if score @s terf_data_B matches 2 run summon minecraft:item_display ^-.5 ^1.5 ^ {Tags:["terf_limbo","terf_limbo_hint"]}
execute if score @s terf_data_B matches 3 run summon minecraft:item_display ^.5 ^0.51 ^ {Tags:["terf_limbo","terf_limbo_hint"]}
execute if score @s terf_data_B matches 4 run summon minecraft:item_display ^-.5 ^0.51 ^ {Tags:["terf_limbo","terf_limbo_hint"]}
execute if score @s terf_data_B matches 5 run summon minecraft:item_display ^.5 ^-0.51 ^ {Tags:["terf_limbo","terf_limbo_hint"]}
execute if score @s terf_data_B matches 6 run summon minecraft:item_display ^-.5 ^-0.51 ^ {Tags:["terf_limbo","terf_limbo_hint"]}
execute if score @s terf_data_B matches 7 run summon minecraft:item_display ^.5 ^-1.5 ^ {Tags:["terf_limbo","terf_limbo_hint"]}
execute if score @s terf_data_B matches 8 run summon minecraft:item_display ^-.5 ^-1.5 ^ {Tags:["terf_limbo","terf_limbo_hint"]}
