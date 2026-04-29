function terf:entity/machines/pressurizer/stand/depressurize_args with entity @s data.terf
kill @s
summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_particle","terf_gas_leak"],view_range:600,alignment:center}
