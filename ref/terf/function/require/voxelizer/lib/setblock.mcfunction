tag @s remove terf_currententity
data modify entity @s block_state set from entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components."minecraft:custom_data"

execute store result score temp terf_states run data get entity @s Pos[0]
execute store result score temp2 terf_states run data get entity @s Pos[1]
execute store result score temp3 terf_states run data get entity @s Pos[2]

scoreboard players operation temp terf_states -= x2 terf_states
scoreboard players operation temp2 terf_states -= y2 terf_states
scoreboard players operation temp3 terf_states -= z2 terf_states

execute store result entity @s transformation.translation[0] float 1 run scoreboard players get temp terf_states
execute store result entity @s transformation.translation[1] float 1 run scoreboard players get temp2 terf_states
execute store result entity @s transformation.translation[2] float 1 run scoreboard players get temp3 terf_states
$tp @s $(x). $(y). $(z).