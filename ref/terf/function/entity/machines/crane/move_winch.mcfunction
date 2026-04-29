execute unless block ^ ^ ^1 #terf:air_and_water run scoreboard players set terminated terf_states 1
execute if block ~ ~-1 ~ #terf:crane_liftable positioned ~ ~-1 ~ run function terf:entity/machines/crane/move_winch
execute if block ~ ~-1 ~ iron_chain[axis=y] positioned ~ ~-1 ~ run function terf:entity/machines/crane/move_winch

execute if score terminated terf_states matches 0 run function terf:entity/machines/crane/move_block
execute if score terminated terf_states matches 0 run playsound minecraft:block.copper_bulb.turn_on master @a[distance=0..] ~ ~ ~ 1 0