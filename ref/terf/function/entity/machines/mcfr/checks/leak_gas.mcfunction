$scoreboard players set fluid_amount terf_states $(amount)
data remove storage terf:temp args
$data modify storage terf:temp args set from storage terf:constants fluid_dictionary.$(id)
execute store result storage terf:temp args.amount int 1 run scoreboard players get fluid_amount terf_states
function terf:require/fluid_into_gas
execute if score fluid_amount terf_states matches 5000.. run scoreboard players set fluid_amount terf_states 5000
execute if score fluid_amount terf_states matches ..49 run return fail
playsound terf:explosion.crash master @a[distance=0..] ~ ~ ~ 8 0
playsound minecraft:block.fire.extinguish master @a[distance=0..] ~ ~ ~ 8.5 0.5
playsound minecraft:block.fire.extinguish master @a[distance=0..] ~ ~ ~ 8 0.6
playsound minecraft:block.fire.extinguish master @a[distance=0..] ~ ~ ~ 7.5 0.7
playsound minecraft:block.fire.extinguish master @a[distance=0..] ~ ~ ~ 7 0.8
playsound minecraft:block.fire.extinguish master @a[distance=0..] ~ ~ ~ 6.5 0.9
playsound minecraft:block.fire.extinguish master @a[distance=0..] ~ ~ ~ 6 1
playsound minecraft:block.fire.extinguish master @a[distance=0..] ~ ~ ~ 5.5 1.1
playsound minecraft:block.fire.extinguish master @a[distance=0..] ~ ~ ~ 5 1.2
playsound minecraft:block.fire.extinguish master @a[distance=0..] ~ ~ ~ 4.5 1.3
playsound minecraft:block.fire.extinguish master @a[distance=0..] ~ ~ ~ 4 1.4
playsound minecraft:block.fire.extinguish master @a[distance=0..] ~ ~ ~ 3.5 1.5
playsound minecraft:block.fire.extinguish master @a[distance=0..] ~ ~ ~ 3 1.6
playsound minecraft:block.fire.extinguish master @a[distance=0..] ~ ~ ~ 2.5 1.7
playsound minecraft:block.fire.extinguish master @a[distance=0..] ~ ~ ~ 2 1.8
playsound minecraft:block.fire.extinguish master @a[distance=0..] ~ ~ ~ 1.5 1.9
playsound minecraft:block.fire.extinguish master @a[distance=0..] ~ ~ ~ 1 2
particle large_smoke ~ ~ ~ 0.2 0.2 0.2 1 1000 force
scoreboard players add @a[distance=..20] terf_data_P 30