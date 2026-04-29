scoreboard players set rod_activated terf_states 0
execute if block ~ ~ ~ minecraft:light_blue_glazed_terracotta[facing=south] run setblock ~ ~ ~ cyan_glazed_terracotta[facing=south]
execute if block ~ ~ ~ minecraft:light_blue_glazed_terracotta[facing=east] run setblock ~ ~ ~ cyan_glazed_terracotta[facing=east]
execute if block ~ ~ ~ minecraft:light_blue_glazed_terracotta[facing=north] run setblock ~ ~ ~ cyan_glazed_terracotta[facing=north]
execute if block ~ ~ ~ minecraft:light_blue_glazed_terracotta[facing=west] run setblock ~ ~ ~ cyan_glazed_terracotta[facing=west]
playsound terf:control_rod_down master @a[distance=0..] ~ ~ ~ 2