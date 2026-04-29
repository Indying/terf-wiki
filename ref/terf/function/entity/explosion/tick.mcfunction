execute if entity @s[tag=terf_small_explosion] run return run function terf:entity/explosion/small_explosion/tick
execute if entity @s[tag=terf_large_explosion] run return run function terf:entity/explosion/large_explosion/tick
execute if entity @s[tag=terf_antimatter_explosion] run return run function terf:entity/explosion/antimatter/tick with entity @s data.terf
execute if entity @s[tag=terf_nuclear_explosion] run return run function terf:entity/explosion/nuclear/tick
execute if entity @s[tag=terf_discharge_explosion] run function terf:entity/explosion/discharge/tick with entity @s data.terf
