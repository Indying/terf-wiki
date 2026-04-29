execute if entity @s[tag=!terf_locked] if block ^ ^1 ^-1 waxed_lightning_rod run function terf:entity/machines/capsule_interface/locked with entity @s data.terf
execute if entity @s[tag=terf_locked] unless block ^ ^1 ^-1 waxed_lightning_rod run function terf:entity/machines/capsule_interface/unlocked with entity @s data.terf
