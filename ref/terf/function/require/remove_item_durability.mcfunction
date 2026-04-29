$data modify storage terf:temp temp set from block ~ ~ ~ Items[{Slot:$(slot)b}].components

execute store result score max_damage terf_states run data get storage terf:temp temp.minecraft:max_damage
execute store result score damage terf_states run data get storage terf:temp temp.minecraft:damage

scoreboard players add damage terf_states 1

execute if score damage terf_states >= max_damage terf_states run playsound minecraft:entity.item.break master @a[distance=0..] ~ ~ ~ 2 1
$execute if score damage terf_states >= max_damage terf_states run data remove block ~ ~ ~ Items[{Slot:$(slot)b}]
$execute store result block ~ ~ ~ Items[{Slot:$(slot)b}].components.minecraft:damage int 1 run scoreboard players get damage terf_states