scoreboard players remove terminated terf_states 1
execute if score terminated terf_states matches 1.. unless block ~ ~ ~ white_glazed_terracotta positioned ^ ^ ^.05 run return run function terf:entity/machines/mcfr/welding_effect/raycast
execute unless score terminated terf_states matches 1.. run return fail
execute align xyz if block ~ ~ ~ white_glazed_terracotta[facing=south] if block ~-1 ~ ~ white_glazed_terracotta[facing=west] rotated 0 0 run function terf:entity/machines/mcfr/welding_effect/effects_side
execute align xyz if block ~ ~ ~ white_glazed_terracotta[facing=east] if block ~ ~ ~1 white_glazed_terracotta[facing=south] rotated -90 0 positioned ~ ~ ~1 run function terf:entity/machines/mcfr/welding_effect/effects_side
execute align xyz if block ~ ~ ~ white_glazed_terracotta[facing=north] if block ~1 ~ ~ white_glazed_terracotta[facing=east] rotated 180 0 positioned ~1 ~ ~1 run function terf:entity/machines/mcfr/welding_effect/effects_side
execute align xyz if block ~ ~ ~ white_glazed_terracotta[facing=west] if block ~ ~ ~-1 white_glazed_terracotta[facing=north] rotated 90 0 positioned ~1 ~ ~ run function terf:entity/machines/mcfr/welding_effect/effects_side

execute align xyz if block ~ ~ ~ white_glazed_terracotta[facing=south] if block ~ ~ ~-1 white_glazed_terracotta[facing=east] rotated -90 0 run function terf:entity/machines/mcfr/welding_effect/effects_side
execute align xyz if block ~ ~ ~ white_glazed_terracotta[facing=east] if block ~-1 ~ ~ white_glazed_terracotta[facing=north] rotated 180 0 positioned ~ ~ ~1 run function terf:entity/machines/mcfr/welding_effect/effects_side
execute align xyz if block ~ ~ ~ white_glazed_terracotta[facing=north] if block ~ ~ ~1 white_glazed_terracotta[facing=west] rotated 90 0 positioned ~1 ~ ~1 run function terf:entity/machines/mcfr/welding_effect/effects_side
execute align xyz if block ~ ~ ~ white_glazed_terracotta[facing=west] if block ~1 ~ ~ white_glazed_terracotta[facing=south] rotated 0 0 positioned ~1 ~ ~ run function terf:entity/machines/mcfr/welding_effect/effects_side

execute align xyz if block ~ ~ ~ white_glazed_terracotta[facing=south] if block ~ ~-1 ~ white_glazed_terracotta[facing=south] rotated -90 0 run function terf:entity/machines/mcfr/welding_effect/effects_horizontal
execute align xyz if block ~ ~ ~ white_glazed_terracotta[facing=east] if block ~ ~-1 ~ white_glazed_terracotta[facing=east] rotated 180 0 positioned ~ ~ ~1 run function terf:entity/machines/mcfr/welding_effect/effects_horizontal
execute align xyz if block ~ ~ ~ white_glazed_terracotta[facing=north] if block ~ ~-1 ~ white_glazed_terracotta[facing=north] rotated 90 0 positioned ~1 ~ ~1 run function terf:entity/machines/mcfr/welding_effect/effects_horizontal
execute align xyz if block ~ ~ ~ white_glazed_terracotta[facing=west] if block ~ ~-1 ~ white_glazed_terracotta[facing=west] rotated 0 0 positioned ~1 ~ ~ run function terf:entity/machines/mcfr/welding_effect/effects_horizontal

execute align xyz if block ~ ~ ~ white_glazed_terracotta[facing=south] if block ~ ~1 ~ white_glazed_terracotta[facing=south] rotated -90 0 positioned ~ ~1 ~ run function terf:entity/machines/mcfr/welding_effect/effects_horizontal
execute align xyz if block ~ ~ ~ white_glazed_terracotta[facing=east] if block ~ ~1 ~ white_glazed_terracotta[facing=east] rotated 180 0 positioned ~ ~1 ~1 run function terf:entity/machines/mcfr/welding_effect/effects_horizontal
execute align xyz if block ~ ~ ~ white_glazed_terracotta[facing=north] if block ~ ~1 ~ white_glazed_terracotta[facing=north] rotated 90 0 positioned ~1 ~1 ~1 run function terf:entity/machines/mcfr/welding_effect/effects_horizontal
execute align xyz if block ~ ~ ~ white_glazed_terracotta[facing=west] if block ~ ~1 ~ white_glazed_terracotta[facing=west] rotated 0 0 positioned ~1 ~1 ~ run function terf:entity/machines/mcfr/welding_effect/effects_horizontal
