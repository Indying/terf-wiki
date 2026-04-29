data modify entity @s data.terf.stored_recipe set from storage terf:temp output.z
execute store result score @s terf_data_A run data get storage terf:temp output.t
item modify block ^1 ^1 ^-1 container.3 datapipes_lib:decrement_item
execute positioned ^1 ^1 ^-1 run function terf:require/remove_item_durability {slot:5}