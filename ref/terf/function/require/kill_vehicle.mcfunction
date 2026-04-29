execute if entity @s[tag=terf_currententity] run return fail
execute if entity @s[type=player] run return fail
tag @s add terf_currententity

execute on passengers run function terf:require/kill_vehicle
execute on vehicle run function terf:require/kill_vehicle
kill @s