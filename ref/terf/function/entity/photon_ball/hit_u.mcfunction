scoreboard players operation rotation_y terf_states /= -1 terf_states
particle minecraft:flame ~ ~0.1 ~ 0.2 0 0.2 0 10
playsound minecraft:entity.firework_rocket.blast master @a[distance=0..] ~ ~ ~ 1 1.2
scoreboard players add @s terf_data_A 1
execute store result score temp terf_states run random value -100..100
scoreboard players operation rotation_x terf_states += temp terf_states
execute store result score temp terf_states run random value -100..100
scoreboard players operation rotation_y terf_states += temp terf_states
