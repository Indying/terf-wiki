function terf:entity/machines/stfr/receptacles/make_injection_list with entity @s data.terf

setblock ~ ~1 ~10 minecraft:barrier
setblock ~ ~1 ~9 minecraft:barrier
setblock ~ ~-1 ~10 minecraft:barrier
setblock ~ ~-1 ~9 minecraft:barrier

setblock ~1 ~1 ~10 minecraft:barrier
setblock ~1 ~1 ~9 minecraft:barrier
setblock ~1 ~-1 ~10 minecraft:barrier
setblock ~1 ~-1 ~9 minecraft:barrier

setblock ~-1 ~1 ~10 minecraft:barrier
setblock ~-1 ~1 ~9 minecraft:barrier
setblock ~-1 ~-1 ~10 minecraft:barrier
setblock ~-1 ~-1 ~9 minecraft:barrier

setblock ~1 ~ ~10 minecraft:barrier
setblock ~1 ~ ~9 minecraft:barrier
setblock ~-1 ~ ~10 minecraft:barrier
setblock ~-1 ~ ~9 minecraft:barrier

setblock ~ ~ ~10 minecraft:barrier

setblock ~2 ~ ~3 minecraft:barrier
setblock ~-2 ~ ~3 minecraft:barrier
setblock ~ ~2 ~3 minecraft:barrier
setblock ~ ~-2 ~3 minecraft:barrier

$summon minecraft:item_display ~ ~ ~10 {Tags:["terf_stab_rotor","terf_stab_s_part","terf_related_$(machine_id)"],interpolation_duration:3,Rotation:[-90.0f,0.0f],item:{id:"minecraft:carrot_on_a_stick",components:{item_model:"terf:visual/stfr/stabilizer_rotor_2"},Count:1b}}
$summon minecraft:item_display ~ ~ ~3 {Tags:["terf_stab_s_part","terf_related_$(machine_id)"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[8f,8f,8f]},item:{id:"minecraft:stone",count:1,components:{"minecraft:item_model":"terf:visual/stfr/rods_directed"}},Rotation:[0f,0f]}
