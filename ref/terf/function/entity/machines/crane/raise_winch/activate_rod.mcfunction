scoreboard players set rod_activated terf_states 1
execute if block ~ ~ ~ minecraft:cyan_glazed_terracotta[facing=south] run setblock ~ ~ ~ light_blue_glazed_terracotta[facing=south]
execute if block ~ ~ ~ minecraft:cyan_glazed_terracotta[facing=east] run setblock ~ ~ ~ light_blue_glazed_terracotta[facing=east]
execute if block ~ ~ ~ minecraft:cyan_glazed_terracotta[facing=north] run setblock ~ ~ ~ light_blue_glazed_terracotta[facing=north]
execute if block ~ ~ ~ minecraft:cyan_glazed_terracotta[facing=west] run setblock ~ ~ ~ light_blue_glazed_terracotta[facing=west]
playsound terf:control_rod_up master @a[distance=0..] ~ ~ ~ 2