particle minecraft:crit ~ ~-0.5 ~ 0.5 0.5 0.5 1 100 force
execute unless score @s terf_data_B matches 100.. run playsound minecraft:block.heavy_core.break player @a[distance=0..] ~ ~ ~ 1 1.5
scoreboard players add @s terf_data_B 1


scoreboard players set temp terf_states 200
scoreboard players operation temp terf_states -= @s terf_data_B
data modify storage terf:temp args set value {arg1:'playsound minecraft:entity.player.attack.crit player @a[distance=0..] ~ ~ ~ 1 '}
execute store result storage terf:temp args.arg2 float 0.005 run scoreboard players get temp terf_states
function datapipes_lib:require/with_args/2 with storage terf:temp args

#die
execute if score @s terf_data_B matches 100.. on vehicle run function terf:entity/vehicle/art/break

execute store result storage terf:temp args.amount float 0.005 run random value -1000..1000
execute on vehicle on passengers if entity @s[tag=terf_art_gun] at @s run function terf:entity/vehicle/art/rotate_pitch with storage terf:temp args
