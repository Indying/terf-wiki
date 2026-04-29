data modify storage terf:temp args set value {arg1:"execute as @e[tag=terf_related_",arg3:"] run function terf:require/drop_item_display"}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
execute at @s positioned ~.5 ~6 ~.5 run function datapipes_lib:require/with_args/3 with storage terf:temp args

scoreboard players set @s terf_data_D 0

data remove entity @s data.terf.stored_item
data remove entity @s data.terf.stored_recipe

execute at @s run playsound terf:lightsswitch ambient @a[distance=0..] ~ ~ ~ 4 0
execute at @s run playsound terf:lightsswitch ambient @a[distance=0..] ~ ~ ~ 4 0
execute at @s run playsound terf:lightsswitch ambient @a[distance=0..] ~ ~ ~ 4 0
execute at @s run playsound terf:lightsswitch ambient @a[distance=0..] ~ ~ ~ 4 0
execute at @s run playsound terf:lightsswitch ambient @a[distance=0..] ~ ~ ~ 4 0
execute at @s run playsound terf:lightsswitch ambient @a[distance=0..] ~ ~ ~ 4 0
execute at @s run playsound terf:lightsswitch ambient @a[distance=0..] ~ ~ ~ 4 0
execute at @s run playsound terf:lightsswitch ambient @a[distance=0..] ~ ~ ~ 4 0

execute as @e[tag=terf_opencore_attracted] run data modify entity @s NoGravity set value 0b
tag @e remove terf_opencore_attracted

scoreboard players set @s datapipes_lib_power_max 0
scoreboard players set @s datapipes_lib_power_storage 0
