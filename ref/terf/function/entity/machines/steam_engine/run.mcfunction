scoreboard players remove @s terf_data_A 1
scoreboard players set @s terf_data_B 0

particle poof ^ ^-2.2 ^ 0.1 0 0.1 0.2 5
playsound minecraft:entity.sniffer.sniffing master @a[distance=0..] ~ ~-2 ~ 1 2
playsound minecraft:entity.sniffer.sniffing master @a[distance=0..] ^-1 ^-1 ^ 1 0
scoreboard players add @s datapipes_lib_power_storage 12
execute if score @s datapipes_lib_power_storage > @s datapipes_lib_power_max run scoreboard players operation @s datapipes_lib_power_storage = @s datapipes_lib_power_max
