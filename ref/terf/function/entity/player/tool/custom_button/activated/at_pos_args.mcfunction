$summon interaction ~ ~ ~ {Tags:["terf_custom_button","terf_currententity"],response:1b,width:$(width),height:$(height),data:{on_player_click:"function terf:entity/custom_button/click",on_player_hit:"function terf:entity/custom_button/hit"}}
$summon item_display ~$(x) ~$(iy) ~$(z) {Tags:["terf_custom_button","terf_currententity"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,$(y)f,0f],scale:[$(width)f,$(height)f,$(width)f]},item:{id:"minecraft:carrot_on_a_stick",components:{item_model:"birch_planks"}},brightness:{sky:15,block:15}}
ride @n[type=interaction,tag=terf_currententity] mount @n[type=item_display,tag=terf_currententity]
tag @e remove terf_currententity

playsound minecraft:block.wood.place master @a[distance=0..] ~ ~ ~ 1 0.8

#Remove item from the player
execute if items entity @s[gamemode=!creative] weapon.mainhand *[minecraft:custom_data~{id:"terf:custom_button"}] run return run item modify entity @s weapon.mainhand datapipes_lib:decrement_item
execute if items entity @s[gamemode=!creative] weapon.offhand *[minecraft:custom_data~{id:"terf:custom_button"}] run item modify entity @s weapon.offhand datapipes_lib:decrement_item
