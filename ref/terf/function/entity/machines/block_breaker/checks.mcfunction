execute rotated 0 -90 if block ~ ~ ~ minecraft:dispenser[facing=up] if block ^ ^ ^1 minecraft:observer[facing=down] run return run rotate @s ~ ~
execute rotated 0 90 if block ~ ~ ~ minecraft:dispenser[facing=down] if block ^ ^ ^1 minecraft:observer[facing=up] run return run rotate @s ~ ~

execute rotated 0 0 if block ~ ~ ~ minecraft:dispenser[facing=south] if block ^ ^ ^1 minecraft:observer[facing=north] run return run rotate @s ~ ~
execute rotated 180 0 if block ~ ~ ~ minecraft:dispenser[facing=north] if block ^ ^ ^1 minecraft:observer[facing=south] run return run rotate @s ~ ~

execute rotated -90 0 if block ~ ~ ~ minecraft:dispenser[facing=east] if block ^ ^ ^1 minecraft:observer[facing=west] run return run rotate @s ~ ~
execute rotated 90 0 if block ~ ~ ~ minecraft:dispenser[facing=west] if block ^ ^ ^1 minecraft:observer[facing=east] run return run rotate @s ~ ~
