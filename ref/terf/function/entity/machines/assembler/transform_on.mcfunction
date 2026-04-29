tag @s add terf_setup
$kill @e[tag=terf_assembler,type=minecraft:item_display,tag=terf_related_$(machine_id)]
$summon item_display ~ ~6.5 ~ {Tags:["terf_assembler","terf_assembler_platform","terf_related_$(machine_id)"],item:{id:"minecraft:stone",components:{item_model:"terf:visual/assembler/platform"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[16f,16f,16f]},interpolation_duration:3}
$summon item_display ~ ~6.5 ~ {Tags:["terf_assembler","terf_assembler_rails","terf_related_$(machine_id)"],item:{id:"minecraft:stone",components:{item_model:"terf:visual/assembler/rails"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[16f,16f,16f]},interpolation_duration:3}
$summon item_display ~ ~6.5 ~ {Tags:["terf_assembler","terf_assembler_courtain_5","terf_related_$(machine_id)"],item:{id:"minecraft:stone",components:{item_model:"terf:visual/assembler/courtain"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[15.6f,16f,15.6f]},interpolation_duration:3}
$summon item_display ~ ~6.5 ~ {Tags:["terf_assembler","terf_assembler_courtain_4","terf_related_$(machine_id)"],item:{id:"minecraft:stone",components:{item_model:"terf:visual/assembler/courtain"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[15.2f,16f,15.2f]},interpolation_duration:3}
$summon item_display ~ ~6.5 ~ {Tags:["terf_assembler","terf_assembler_courtain_3","terf_related_$(machine_id)"],item:{id:"minecraft:stone",components:{item_model:"terf:visual/assembler/courtain"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[14.8f,16f,14.8f]},interpolation_duration:3}
$summon item_display ~ ~6.5 ~ {Tags:["terf_assembler","terf_assembler_courtain_2","terf_related_$(machine_id)"],item:{id:"minecraft:stone",components:{item_model:"terf:visual/assembler/courtain"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[14.4f,16f,14.4f]},interpolation_duration:3}
$summon item_display ~ ~6.5 ~ {Tags:["terf_assembler","terf_assembler_courtain_1","terf_related_$(machine_id)"],item:{id:"minecraft:stone",components:{item_model:"terf:visual/assembler/courtain"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[14f,16f,14f]},interpolation_duration:3}

setblock ^-2 ^6 ^-3 barrier
setblock ^-1 ^6 ^-3 barrier
setblock ^ ^6 ^-3 barrier
setblock ^1 ^6 ^-3 barrier
setblock ^2 ^6 ^-3 barrier
setblock ^3 ^6 ^-3 barrier

setblock ^-2 ^6 ^-2 barrier
setblock ^-1 ^6 ^-2 barrier
setblock ^ ^6 ^-2 barrier
setblock ^1 ^6 ^-2 barrier
setblock ^2 ^6 ^-2 barrier
setblock ^3 ^6 ^-2 barrier

setblock ^-2 ^6 ^-1 barrier
setblock ^-1 ^6 ^-1 barrier
setblock ^ ^6 ^-1 barrier
setblock ^1 ^6 ^-1 barrier
setblock ^2 ^6 ^-1 barrier
setblock ^3 ^6 ^-1 barrier

setblock ^-2 ^6 ^ barrier
setblock ^-1 ^6 ^ barrier
setblock ^ ^6 ^ barrier
setblock ^1 ^6 ^ barrier
setblock ^2 ^6 ^ barrier
setblock ^3 ^6 ^ barrier

setblock ^-2 ^6 ^1 barrier
setblock ^-1 ^6 ^1 barrier
setblock ^ ^6 ^1 barrier
setblock ^1 ^6 ^1 barrier
setblock ^2 ^6 ^1 barrier
setblock ^3 ^6 ^1 barrier

setblock ^-2 ^6 ^2 barrier
setblock ^-1 ^6 ^2 barrier
setblock ^ ^6 ^2 barrier
setblock ^1 ^6 ^2 barrier
setblock ^2 ^6 ^2 barrier
setblock ^3 ^6 ^2 barrier

setblock ^-2 ^6 ^3 barrier
setblock ^-1 ^6 ^3 barrier
setblock ^ ^6 ^3 barrier
setblock ^1 ^6 ^3 barrier
setblock ^2 ^6 ^3 barrier
setblock ^3 ^6 ^3 barrier

setblock ^-2 ^6 ^-4 barrier
setblock ^-1 ^6 ^-4 barrier
setblock ^ ^6 ^-4 barrier
setblock ^1 ^6 ^-4 barrier
setblock ^2 ^6 ^-4 barrier
setblock ^3 ^6 ^-4 barrier

setblock ^-3 ^6 ^-3 barrier
setblock ^-3 ^6 ^-2 barrier
setblock ^-3 ^6 ^-1 barrier
setblock ^-3 ^6 ^ barrier
setblock ^-3 ^6 ^1 barrier
setblock ^-3 ^6 ^2 barrier

setblock ^4 ^6 ^-3 barrier
setblock ^4 ^6 ^-2 barrier
setblock ^4 ^6 ^-1 barrier
setblock ^4 ^6 ^ barrier
setblock ^4 ^6 ^1 barrier
setblock ^4 ^6 ^2 barrier

setblock ^4 ^6 ^3 barrier
setblock ^-3 ^6 ^3 barrier

setblock ^4 ^6 ^-4 barrier
setblock ^-3 ^6 ^-4 barrier

setblock ^4 ^6 ^4 barrier
setblock ^-3 ^6 ^4 barrier

setblock ^4 ^6 ^-5 barrier
setblock ^-3 ^6 ^-5 barrier

setblock ^5 ^6 ^3 barrier
setblock ^5 ^6 ^-4 barrier

setblock ^-4 ^6 ^3 barrier
setblock ^-4 ^6 ^-4 barrier
