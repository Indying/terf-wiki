setblock ~ ~ ~ minecraft:sculk_catalyst[bloom=true]
execute align xyz run summon minecraft:marker ~.5 ~.5 ~.5 {Tags:["terf_super_catalyst","terf_currententity"]}

summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_particle","terf_large_flash"],billboard:"center",text:{"text":"\ueef2","color":"aqua"},background:0,view_range:16,brightness:{sky:15,block:15},alignment:center}
playsound terf:explosion.explosion_far2 block @a[distance=0..] ~ ~ ~ 10

execute as @e[type=marker,tag=terf_super_catalyst,tag=terf_currententity,limit=1] run function terf:entity/sculk_charge/super_catalyst/when_summoned

tag @e remove terf_currententity

execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon
execute positioned ~ ~-1 ~ run function terf:entity/sculk_charge/summon