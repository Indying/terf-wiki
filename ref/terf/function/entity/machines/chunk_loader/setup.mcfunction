tag @s add terf_chunk_loader
data modify entity @s data.terf.multiblock_function set value "if block ~ ~ ~ respawn_anchor run function terf:entity/machines/chunk_loader/tick"
data modify entity @s data.terf.before_warp set value "run forceload remove ~-48 ~-48 ~48 ~48"
data modify entity @s data.terf.after_warp set value "run forceload remove ~-48 ~-48 ~48 ~48"
