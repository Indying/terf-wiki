summon item ~ ~ ~ {Item:{id:"minecraft:carrot_on_a_stick",components:{item_model:"terf:part/dark_prismarine_bit",item_name:"Dark Prismarine Bit","!minecraft:max_damage":{},max_stack_size:64,custom_data:{id:"terf:dark_prismarine_bit",terf:{click:"terf:entity/player/tool/prismarine_bit/activated"}}}}}
playsound minecraft:block.stone.break block @a[distance=0..] ~ ~ ~ 1 1
particle block{block_state:dark_prismarine} ~ ~ ~ 0 0 0 1 3 force
kill @s
execute align xyz positioned ~.125 ~ ~.125 unless entity @e[tag=terf_dark_prismarine_bit,dx=0,dy=0,dz=0] run setblock ~ ~ ~ air