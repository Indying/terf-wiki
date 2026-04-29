execute store success score succeeded terf_states run attribute @s minecraft:scale base get
execute if score succeeded terf_states matches 0 run return fail

tag @s add terf_currententity

#the scale here is a multiplier adder, 1 is 2x scale, -1 is 0x scale.
execute store result score temp terf_states run attribute @s minecraft:scale modifier value get terf:shrink_ray 1000

execute if score mode terf_states matches 0 run scoreboard players remove temp terf_states 5
execute if score mode terf_states matches 1 run scoreboard players add temp terf_states 5

#minimums and maximums
execute if score temp terf_states matches ..-701 run advancement grant @s only terf:fabricator/ant_man
execute if score temp terf_states matches ..-701 run scoreboard players set temp terf_states -700
execute if score temp terf_states matches 2001.. run scoreboard players set temp terf_states 2000

#snap points
execute if score temp terf_states matches 995..1005 if predicate datapipes_lib:chances/90 run scoreboard players set temp terf_states 1000
execute if score temp terf_states matches -5..5 if predicate datapipes_lib:chances/90 run scoreboard players set temp terf_states 0
execute if score temp terf_states matches -505..-495 if predicate datapipes_lib:chances/90 run scoreboard players set temp terf_states -500

#set attributes
execute if entity @s[type=player] if score temp terf_states matches 0 run return run function terf:entity/player/tool/shrink_ray/reset_scale with storage terf:temp args

execute store result storage terf:temp args.scale double 0.001 run scoreboard players get temp terf_states
function terf:entity/player/tool/shrink_ray/set_scale with storage terf:temp args
