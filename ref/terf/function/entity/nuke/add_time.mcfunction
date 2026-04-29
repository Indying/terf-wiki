playsound terf:alarms.toolbeep master @a[distance=0..] ~ ~ ~ 1 1

execute on vehicle run scoreboard players operation temp terf_states = @s terf_data_A
scoreboard players set sneaking terf_states 0
execute on target if predicate datapipes_lib:pressing_sneak run scoreboard players set sneaking terf_states 1

execute if score sneaking terf_states matches 1 run scoreboard players remove temp terf_states 200
execute if score sneaking terf_states matches 0 run scoreboard players add temp terf_states 200
execute if score temp terf_states matches 4801.. run scoreboard players set temp terf_states 0
execute if score temp terf_states matches ..-1 run scoreboard players set temp terf_states 4800

execute on vehicle run scoreboard players operation @s terf_data_A = temp terf_states

scoreboard players operation temp terf_states /= 20 terf_states
execute on target run tellraw @s ["[",{"text":"Nuclear Bomb","color":"gold"},"] Detonation countdown set to ",{"score":{"objective":"terf_states","name":"temp"}},"s"]
