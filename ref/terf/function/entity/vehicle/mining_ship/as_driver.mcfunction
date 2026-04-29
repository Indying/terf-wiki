data modify storage terf:temp temp2 set from entity @s Rotation

effect give @s minecraft:resistance 1 3 true
effect give @s minecraft:slow_falling 5 1 true

#ui
scoreboard players operation speed terf_states /= 10 terf_states
scoreboard players operation speed2 terf_states = speed terf_states
scoreboard players operation speed2 terf_states /= 10 terf_states
scoreboard players operation speed3 terf_states = speed2 terf_states
scoreboard players operation speed3 terf_states /= 10 terf_states
scoreboard players operation speed2 terf_states %= 10 terf_states
scoreboard players operation speed terf_states %= 10 terf_states

execute if score damage terf_states matches 100.. run scoreboard players add @s terf_data_P 2

title @s actionbar [{"text":"Damage:"},{"score":{"objective":"terf_states","name":"damage"}},{"text":"% | Charge:"},{"score":{"objective":"terf_states","name":"charge"}},{"text":"/500 | Speed:"},{"score":{"objective":"terf_states","name":"speed3"}},{"text":"."},{"score":{"objective":"terf_states","name":"speed2"}},{"score":{"objective":"terf_states","name":"speed"}},{"text":"m/s"}]