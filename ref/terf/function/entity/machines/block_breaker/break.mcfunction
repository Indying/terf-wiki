scoreboard players set @s terf_data_A 0

execute if block ^ ^ ^-2 dispenser[triggered=true] unless block ^ ^ ^-3 #terf:froglight store result score succeeded terf_states run loot spawn ~ ~ ~ mine ~ ~ ~
execute if block ^ ^ ^-2 dispenser[triggered=true] if block ^ ^ ^-3 #terf:froglight store result score succeeded terf_states run loot spawn ~ ~ ~ mine ~ ~ ~ minecraft:netherite_pickaxe[minecraft:enchantments={"minecraft:silk_touch":1}]
execute if block ^ ^ ^-2 dispenser[triggered=true] run data modify entity @n[type=item,distance=..1] Motion set value [0d,0d,0d]
execute unless block ^ ^ ^-2 dispenser[triggered=true] unless block ^ ^ ^-3 #terf:froglight store result score succeeded terf_states run loot insert ^ ^ ^-2 mine ~ ~ ~
execute unless block ^ ^ ^-2 dispenser[triggered=true] if block ^ ^ ^-3 #terf:froglight store result score succeeded terf_states run loot insert ^ ^ ^-2 mine ~ ~ ~ minecraft:netherite_pickaxe[minecraft:enchantments={"minecraft:silk_touch":1}]
execute unless score succeeded terf_states matches 1.. run return fail

setblock ~ ~ ~ air
playsound minecraft:item.trident.hit master @a[distance=0..] ~ ~ ~ 0.5 0
execute align xyz run particle minecraft:electric_spark ~.5 ~.5 ~.5 0.2 0.2 0.2 0 10 force