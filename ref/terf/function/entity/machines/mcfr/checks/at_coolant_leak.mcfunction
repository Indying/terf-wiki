scoreboard players operation coolant_amount terf_states *= 9 terf_states
scoreboard players operation coolant_amount terf_states /= 10 terf_states
execute unless score steam_amount terf_states matches 1000.. run return run scoreboard players set steam_amount terf_states 0
particle poof ~ ~ ~ 0.2 0.2 0.2 1 500 force
playsound minecraft:block.fire.extinguish master @a[distance=0..] ~ ~ ~ 5 0.5
scoreboard players set steam_amount terf_states 0
scoreboard players add @a[distance=..20] terf_data_P 30