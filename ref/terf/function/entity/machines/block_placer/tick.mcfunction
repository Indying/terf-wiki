#terf_data_A = cooldown

execute rotated 0 -90 if block ~ ~ ~ observer[facing=up] if block ^ ^ ^1 dispenser[facing=up] positioned ^ ^ ^1 run return run function terf:entity/machines/block_placer/operation
execute rotated 0 90 if block ~ ~ ~ observer[facing=down] if block ^ ^ ^1 dispenser[facing=down] positioned ^ ^ ^1 run return run function terf:entity/machines/block_placer/operation

execute rotated 0 0 if block ~ ~ ~ observer[facing=south] if block ^ ^ ^1 dispenser[facing=south] positioned ^ ^ ^1 run return run function terf:entity/machines/block_placer/operation
execute rotated 180 0 if block ~ ~ ~ observer[facing=north] if block ^ ^ ^1 dispenser[facing=north] positioned ^ ^ ^1 run return run function terf:entity/machines/block_placer/operation

execute rotated -90 0 if block ~ ~ ~ observer[facing=east] if block ^ ^ ^1 dispenser[facing=east] positioned ^ ^ ^1 run return run function terf:entity/machines/block_placer/operation
execute rotated 90 0 if block ~ ~ ~ observer[facing=west] if block ^ ^ ^1 dispenser[facing=west] positioned ^ ^ ^1 run function terf:entity/machines/block_placer/operation