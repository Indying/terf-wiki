scoreboard players operation temp terf_states = @s terf_data_O
scoreboard players operation temp terf_states /= 10 terf_states

execute if entity @s[tag=!terf_cant_breathe] run tag @s add terf_in_air

execute if score temp terf_states matches 100.. run title @s[tag=!terf_in_air] actionbar {"text":"\uef01\uef00\uef00\uef0a                                                                                                                ","color":"#FFBB33"}
execute if score temp terf_states matches 100.. run title @s[tag=terf_in_air] actionbar {"text":"\uef01\uef00\uef00\uef0a                                                                                                                ","color":"#00FF00"}
execute unless score temp terf_states matches 100.. run function terf:entity/player/oxygen/display

execute as @s[tag=terf_in_air] run return fail

tag @s remove terf_cant_breathe
execute unless score ETratetimer terf_states matches 10.. run return fail
scoreboard players remove @s terf_data_O 1
execute if score @s[tag=!terf_in_air] terf_data_O matches ..200 run playsound terf:alarms.beep7 player @a[distance=0..] ~ ~ ~ 1 2
