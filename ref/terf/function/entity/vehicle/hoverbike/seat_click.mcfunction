scoreboard players set succeeded terf_states 0
execute on target if items entity @s weapon.mainhand *[minecraft:custom_data~{id:"iron_plate"}] run scoreboard players set succeeded terf_states 1
execute on target if items entity @s weapon.mainhand glow_ink_sac run scoreboard players set succeeded terf_states 2
execute on target if items entity @s weapon.mainhand wooden_axe run scoreboard players set succeeded terf_states 3
execute on target if items entity @s weapon.mainhand stone_axe run scoreboard players set succeeded terf_states 3
execute on target if items entity @s weapon.mainhand copper_axe run scoreboard players set succeeded terf_states 3
execute on target if items entity @s weapon.mainhand iron_axe run scoreboard players set succeeded terf_states 3
execute on target if items entity @s weapon.mainhand golden_axe run scoreboard players set succeeded terf_states 3
execute on target if items entity @s weapon.mainhand diamond_axe run scoreboard players set succeeded terf_states 3
execute on target if items entity @s weapon.mainhand netherite_axe run scoreboard players set succeeded terf_states 3

#if the player clicks with a glow ink sac:
execute if score succeeded terf_states matches 2 on passengers if data entity @s[type=item_display] brightness run return fail
execute if score succeeded terf_states matches 2 on target run item modify entity @s[gamemode=!creative] weapon.mainhand datapipes_lib:decrement_item
execute if score succeeded terf_states matches 2 on passengers run data modify entity @s[type=item_display] brightness set value {block:15,sky:15}
execute if score succeeded terf_states matches 2 run playsound minecraft:item.glow_ink_sac.use master @a[distance=0..] ~ ~ ~ 1
execute if score succeeded terf_states matches 2 run return run particle minecraft:wax_on ~ ~.5 ~ 0.2 0.2 0.2 0 10 force

#if the player clicks with an axe:
execute if score succeeded terf_states matches 3 on passengers unless data entity @s[type=item_display] brightness run return fail
execute if score succeeded terf_states matches 3 on passengers run data remove entity @s[type=item_display] brightness
execute if score succeeded terf_states matches 3 run playsound minecraft:item.axe.wax_off master @a[distance=0..] ~ ~ ~ 1
execute if score succeeded terf_states matches 3 run return run particle minecraft:wax_off ~ ~.5 ~ 0.2 0.2 0.2 0 10 force

#if player clicks with a repair item and the vehicle is damaged, repair and return
execute if score @s terf_data_B matches 0 run scoreboard players set succeeded terf_states 0
execute if score succeeded terf_states matches 1 run scoreboard players remove @s terf_data_B 100000
execute if score succeeded terf_states matches 1 if score @s terf_data_B matches ..-1 run scoreboard players set @s terf_data_B 0
scoreboard players operation temp terf_states = @s terf_data_B
execute on passengers store result entity @s[type=item_display] item.components.minecraft:custom_model_data.colors[1] int 1 run scoreboard players get temp terf_states
execute if score succeeded terf_states matches 1 on target run item modify entity @s[gamemode=!creative] weapon.mainhand datapipes_lib:decrement_item
execute if score succeeded terf_states matches 1 run return run playsound minecraft:entity.iron_golem.repair master @a[distance=0..] ~ ~ ~ 1 1

#if player clicks with a dye item, dye and return
#convert current color to rgb
execute on passengers if entity @s[type=item_display] store result score color terf_states run data get entity @s item.components.minecraft:custom_model_data.colors[0]

scoreboard players operation R terf_states = color terf_states
scoreboard players operation R terf_states /= 65536 terf_states
scoreboard players operation G terf_states = color terf_states
scoreboard players operation G terf_states /= 256 terf_states
scoreboard players operation G terf_states %= 256 terf_states
scoreboard players operation B terf_states = color terf_states
scoreboard players operation B terf_states %= 256 terf_states

#try dying
data remove storage terf:temp array
data modify storage terf:temp args set value {arg1:'data modify storage terf:temp array set from storage terf:constants dye_colors.',arg3:'.vivid.rgb'}
execute on target run data modify storage terf:temp args.arg2 set from entity @s SelectedItem.id
function datapipes_lib:require/with_args/3 with storage terf:temp args

execute store result score Rdiff terf_states run data get storage terf:temp array[0]
scoreboard players operation Rdiff terf_states -= R terf_states
scoreboard players operation Rdiff terf_states /= 5 terf_states

execute store result score Gdiff terf_states run data get storage terf:temp array[1]
scoreboard players operation Gdiff terf_states -= G terf_states
scoreboard players operation Gdiff terf_states /= 5 terf_states

execute store result score Bdiff terf_states run data get storage terf:temp array[2]
scoreboard players operation Bdiff terf_states -= B terf_states
scoreboard players operation Bdiff terf_states /= 5 terf_states

scoreboard players operation R terf_states += Rdiff terf_states
scoreboard players operation G terf_states += Gdiff terf_states
scoreboard players operation B terf_states += Bdiff terf_states

#convert rgb to current color
scoreboard players operation color terf_states = R terf_states
scoreboard players operation color terf_states *= 65536 terf_states
scoreboard players operation temp terf_states = G terf_states
scoreboard players operation temp terf_states *= 256 terf_states
scoreboard players operation color terf_states += temp terf_states
scoreboard players operation color terf_states += B terf_states

execute if data storage terf:temp array on passengers if entity @s[type=item_display] run execute store result entity @s item.components.minecraft:custom_model_data.colors[0] int 1 run scoreboard players get color terf_states
execute if data storage terf:temp array on target run item modify entity @s[gamemode=!creative] weapon.mainhand datapipes_lib:decrement_item
execute if data storage terf:temp array run return run playsound minecraft:item.dye.use master @a[distance=0..] ~ ~ ~ 1 1

#if nothing returns, mount the player on the seat
function terf:require/seat_mount
