title @a[distance=..512] times 0 2 6
title @a[distance=..512] title {text:"\uEff4",color:black}
effect give @a[distance=..512] blindness 2 255 true

scoreboard players set @a[distance=..512] terf_data_P 40
playsound terf:explosion.seismic_blast master @a[distance=0..] ~ ~ ~ 100

execute summon item_display run function terf:entity/explosion/seismic/flash_as

data modify entity @s transformation.scale set value [1000f,1000f,1000f]

data merge entity @s {Rotation:[0f,30f],Tags:["terf_seismic_explosion"],view_range:1000000,item:{id:"carrot_on_a_stick",components:{item_model:"terf:visual/seismic_blast",custom_model_data:{colors:[0]}}}}
execute store result entity @s Rotation[0] float 0.001 run random value 1..360000
