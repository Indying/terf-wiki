scoreboard players set @s terf_data_A 0
data modify storage terf:temp temp set from block ^1 ^ ^ Items[{Slot:2b}]
data modify storage terf:temp temp.count set value 10
data remove storage terf:temp temp.Slot

execute positioned ~ ~1 ~ run function terf:entity/machines/fission_fuel_loader/add_fuel