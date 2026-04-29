execute unless score @s terf_data_A matches 1.. run return run execute on passengers if data entity @s interaction run function terf:entity/stone_plate/as_interaction
execute if score @s terf_data_A matches 1 run playsound terf:music.vortal_combat ui @a[distance=0..] ~ ~ ~ 5 1

execute if entity @s[nbt={Rotation:[90f]}] run tag @s remove terf_stoneplate_rotatevertical
execute if entity @s[nbt={Rotation:[-90f]}] run tag @s add terf_stoneplate_rotatevertical

scoreboard players add @s terf_data_A 1

scoreboard players operation temp2 terf_states = @s terf_data_A
scoreboard players remove temp2 terf_states 1900
scoreboard players operation temp2 terf_states *= 2 terf_states

scoreboard players operation temp terf_states = @s terf_data_A
execute if score temp terf_states matches 1900.. run scoreboard players operation temp terf_states -= temp2 terf_states

scoreboard players operation temp2 terf_states = temp terf_states
scoreboard players operation temp2 terf_states /= 2 terf_states

execute store result storage terf:temp args.horizontal float 0.02 run scoreboard players get temp terf_states
execute store result storage terf:temp args.vertical float 0.2 run scoreboard players get temp2 terf_states
function terf:entity/stone_plate/rotate with storage terf:temp args

execute if score @s terf_data_A matches 3800.. on passengers run data modify entity @s response set value 1b
execute if score @s terf_data_A matches 3800.. on passengers run data remove entity @s interaction
execute if score @s terf_data_A matches 3800.. run scoreboard players set @s terf_data_A 0