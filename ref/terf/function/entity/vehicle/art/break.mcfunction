execute if entity @s[tag=terf_indestructible] run return fail

execute on passengers if entity @s[tag=terf_art_gun] run summon item ~-.3 ~ ~.3 {Item:{id:recovery_compass,components:{max_stack_size:1,rarity:epic,item_name:'"A.R.T Turret"',item_model:"terf:visual/art/gun",custom_data:{id:"terf:art_turret"}}}}
execute on passengers if entity @s[tag=terf_art_stand] run summon item ~.3 ~ ~.3 {Item:{id:recovery_compass,components:{max_stack_size:1,rarity:epic,item_name:'"A.R.T Mount"',item_model:"terf:visual/art/stand",custom_data:{id:"terf:art_mount"}}}}
summon item ~ ~ ~-.3 {Item:{id:creeper_spawn_egg,components:{max_stack_size:1,item_name:'"A.R.T Base"',lore:['[{"text":"Right click with an A.R.T Mount and an A.R.T Turret to assemble.","italic":false}]'],item_model:"terf:visual/art/base",rarity:rare,entity_data:{id:"minecraft:item_display",Rotation:[0f,0f],Tags:["terf_vehicle","terf_art"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-0.125f,0f],scale:[1f,1f,1f]},item:{id:"minecraft:carrot_on_a_stick",count:1,components:{item_model:"terf:visual/art/base"}}}}}}

playsound minecraft:block.heavy_core.break player @a[distance=0..] ~ ~ ~ 2 0
playsound minecraft:block.heavy_core.break player @a[distance=0..] ~ ~ ~ 2 0
playsound minecraft:block.heavy_core.break player @a[distance=0..] ~ ~ ~ 2 0
playsound minecraft:block.heavy_core.break player @a[distance=0..] ~ ~ ~ 2 0
playsound minecraft:block.heavy_core.break player @a[distance=0..] ~ ~ ~ 2 0
playsound minecraft:block.heavy_core.break player @a[distance=0..] ~ ~ ~ 2 0
playsound minecraft:block.heavy_core.break player @a[distance=0..] ~ ~ ~ 2 0
particle minecraft:crit ~ ~-1.3 ~ 0.5 0.1 0.5 0.1 500 force
particle minecraft:crit ~ ~-0.25 ~ 0.1 0.5 0.1 0.1 500 force

execute on passengers if entity @s[type=minecraft:marker] if data entity @s data.terf.security_config run function terf:entity/machines/security_turret/explosion

execute on passengers run kill @s
kill @s
