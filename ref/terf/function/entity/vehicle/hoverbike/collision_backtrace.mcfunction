execute positioned ^ ^ ^-.1 unless block ~ ~ ~ #terf:noclip run return run function terf:entity/vehicle/hoverbike/collision_backtrace

scoreboard players set damage_add terf_states 0

execute if block ~-.1 ~ ~ #terf:noclip if score @s terf_data_X matches 1.. run scoreboard players operation damage_add terf_states += @s terf_data_X
execute if block ~-.1 ~ ~ #terf:noclip if score @s terf_data_X matches 1.. run scoreboard players operation @s terf_data_X /= -1 terf_states
execute if block ~.1 ~ ~ #terf:noclip if score @s terf_data_X matches ..-1 run scoreboard players operation damage_add terf_states -= @s terf_data_X
execute if block ~.1 ~ ~ #terf:noclip if score @s terf_data_X matches ..-1 run scoreboard players operation @s terf_data_X /= -1 terf_states

execute if block ~ ~.1 ~ #terf:noclip if score @s terf_data_Y matches ..1 run scoreboard players operation damage_add terf_states -= @s terf_data_Y
execute if block ~ ~.1 ~ #terf:noclip if score @s terf_data_Y matches ..1 run scoreboard players operation @s terf_data_Y /= -1 terf_states
execute if block ~ ~-.1 ~ #terf:noclip run scoreboard players remove @s terf_data_A 5
execute if block ~ ~-.1 ~ #terf:noclip if score @s terf_data_A matches ..2 run scoreboard players set @s terf_data_A 1

execute if block ~ ~ ~-.1 #terf:noclip if score @s terf_data_Z matches 1.. run scoreboard players operation damage_add terf_states += @s terf_data_Z
execute if block ~ ~ ~-.1 #terf:noclip if score @s terf_data_Z matches 1.. run scoreboard players operation @s terf_data_Z /= -1 terf_states
execute if block ~ ~ ~.1 #terf:noclip if score @s terf_data_Z matches ..-1 run scoreboard players operation damage_add terf_states -= @s terf_data_Z
execute if block ~ ~ ~.1 #terf:noclip if score @s terf_data_Z matches ..-1 run scoreboard players operation @s terf_data_Z /= -1 terf_states

execute on passengers run scoreboard players set @s[type=player] terf_data_P 20

scoreboard players remove damage_add terf_states 200
execute if score damage_add terf_states matches ..-1 run scoreboard players set damage_add terf_states 0
scoreboard players operation damage_add terf_states *= damage_add terf_states
scoreboard players operation @s terf_data_B += damage_add terf_states

execute if score damage_add terf_states matches 1.. run function terf:require/play_with_random_pitch {s:'terf:explosion.crash master @a[distance=0..] ~ ~ ~ 2',min:10000,max:20000}

scoreboard players operation temp terf_states = @s terf_data_B
execute on passengers store result entity @s[type=item_display] item.components.minecraft:custom_model_data.colors[1] int 1 run scoreboard players get temp terf_states

execute if score @s terf_data_B matches 2000000.. run scoreboard players add @s terf_data_A 10