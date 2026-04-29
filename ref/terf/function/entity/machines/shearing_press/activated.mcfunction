#half time
execute store result entity @s data.terf.Ht int 1 store result score @s terf_data_B run data get storage terf:temp output.t 0.5

data modify entity @s data.terf.stored_recipe set from storage terf:temp output.z
execute store result score @s terf_data_A run data get storage terf:temp output.t
item modify block ^1 ^1 ^-1 container.4 datapipes_lib:decrement_item
