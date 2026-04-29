scoreboard players operation position terf_states = @s terf_data_D

execute if score @s terf_data_A matches 2 store result score temp terf_states run random value 0..500000
execute if score @s terf_data_A matches 2 run scoreboard players operation position terf_states -= temp terf_states

execute if score position terf_states matches ..10000 run scoreboard players set position terf_states 10000
execute if score position terf_states matches 60000001.. run scoreboard players set position terf_states 60000000

$execute as @e[type=item_display,tag=terf_assembler_platform,tag=terf_related_$(machine_id)] store result entity @s transformation.translation[1] float -0.0000001 run scoreboard players get position terf_states
$execute as @e[type=item_display,tag=terf_assembler_courtain_5,tag=terf_related_$(machine_id)] store result entity @s transformation.translation[1] float -0.000000083333333333333333 run scoreboard players get position terf_states
$execute as @e[type=item_display,tag=terf_assembler_courtain_4,tag=terf_related_$(machine_id)] store result entity @s transformation.translation[1] float -0.000000066666666666666666 run scoreboard players get position terf_states
$execute as @e[type=item_display,tag=terf_assembler_courtain_3,tag=terf_related_$(machine_id)] store result entity @s transformation.translation[1] float -0.00000005 run scoreboard players get position terf_states
$execute as @e[type=item_display,tag=terf_assembler_courtain_2,tag=terf_related_$(machine_id)] store result entity @s transformation.translation[1] float -0.000000033333333333333333 run scoreboard players get position terf_states
$execute as @e[type=item_display,tag=terf_assembler_courtain_1,tag=terf_related_$(machine_id)] store result entity @s transformation.translation[1] float -0.000000016666666666666666 run scoreboard players get position terf_states
