playsound minecraft:block.heavy_core.place master @a[distance=0..]
summon item_display ~ ~ ~ {Tags:["terf_currententity","terf_fire_extinguisher"]}
summon interaction ~ ~-.5 ~ {width:0.25,Tags:["terf_fire_extinguisher"],data:{on_player_hit:"function terf:entity/player/tool/fire_extinguisher/break"}}
data modify entity @e[type=item_display,tag=terf_currententity,limit=1] item set from storage terf:temp temp
tag @e[type=item_display] remove terf_currententity
scoreboard players set succeeded terf_states 1