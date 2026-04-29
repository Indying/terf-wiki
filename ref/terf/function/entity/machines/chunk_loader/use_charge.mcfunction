particle minecraft:reverse_portal ~ ~ ~ 0 1 0 1 0 force
execute if block ~ ~ ~ respawn_anchor[charges=1] run return run function terf:entity/machines/chunk_loader/use_charge_1
execute if block ~ ~ ~ respawn_anchor[charges=2] run return run function terf:entity/machines/chunk_loader/use_charge_2
execute if block ~ ~ ~ respawn_anchor[charges=3] run return run function terf:entity/machines/chunk_loader/use_charge_3
execute if block ~ ~ ~ respawn_anchor[charges=4] run function terf:entity/machines/chunk_loader/use_charge_4
