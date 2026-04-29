scoreboard players set @s terf_data_A 60
data modify entity @s data.fluids[0].amount set value 0

$data modify storage terf:temp array set from storage terf:constants pressurizer_storage.$(machine_id)
data modify storage terf:temp args.x set from storage terf:temp array[0][0]
data modify storage terf:temp args.y set from storage terf:temp array[0][1]
data modify storage terf:temp args.z set from storage terf:temp array[0][2]
function terf:entity/machines/pressurizer/array_iterate with storage terf:temp args
$data modify storage terf:constants pressurizer_storage.$(machine_id) set value []
$kill @e[type=minecraft:armor_stand,tag=terf_gas_oxygen,tag=terf_related_$(machine_id)]

playsound minecraft:entity.breeze.shoot ambient @a[distance=0..] ~ ~ ~ 5 0
execute if score fluid_amount terf_states matches ..0 run return run playsound minecraft:block.fire.extinguish ambient @a[distance=0..] ~ ~ ~ 5 0
playsound terf:explosion.huge_explosion ambient @a[distance=0..] ~ ~ ~ 5 2
playsound minecraft:entity.warden.death ambient @a[distance=0..] ~ ~ ~ 5 0
playsound minecraft:entity.breeze.charge ambient @a[distance=0..] ~ ~ ~ 5 0
playsound minecraft:entity.breeze.wind_burst ambient @a[distance=0..] ~ ~ ~ 5 0
playsound minecraft:entity.breeze.inhale ambient @a[distance=0..] ~ ~ ~ 5 0
