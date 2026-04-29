playsound terf:alarms.toolbeep master @a[distance=0..] ~ ~ ~ 1 1

#fail if theres not enough power
execute if score power_storage terf_states < power_max terf_states on target run return run tellraw @s ["[",{text:"Electron Bomb","color":"gold"},"] ",{text:"Attach bomb to a High Voltage Conductor to charge.",color:yellow}]

#add time
execute on passengers if entity @s[type=item_display] store result score temp terf_states run data get entity @s item.components.minecraft:custom_data.terf.timer

execute if score sneaking terf_states matches 1 run scoreboard players remove temp terf_states 200
execute if score sneaking terf_states matches 0 run scoreboard players add temp terf_states 200
execute if score temp terf_states matches 4801.. run scoreboard players set temp terf_states 200
execute if score temp terf_states matches ..199 run scoreboard players set temp terf_states 4800

execute on passengers if entity @s[type=item_display] store result entity @s item.components.minecraft:custom_data.terf.timer int 1 run scoreboard players get temp terf_states

scoreboard players operation temp terf_states /= 20 terf_states
execute on target run tellraw @s ["[",{text:"Electron Bomb","color":"gold"},"] Timer set to ",{"score":{"objective":"terf_states","name":"temp"}},"s"]
