playsound terf:alarms.toolbeep master @a[distance=0..] ~ ~ ~ 1 0

execute on vehicle run scoreboard players operation temp terf_states = @s terf_data_B
scoreboard players operation temp terf_states /= 20 terf_states
execute on target run tellraw @s ["[",{"text":"Nuclear Bomb","color":"gold"},"] ",{"text":"Detonating in ","color":"dark_red"},{"score":{"objective":"terf_states","name":"temp"},"color":"red"},{"text":"s...","color":"dark_red"}]
