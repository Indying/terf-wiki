execute if score NETratetimer terf_states >= NETrate terf_states unless score @s terf_data_A matches 0.. run function terf:entity/player/tool/electron_bomb/update_display

execute unless score @s terf_data_A matches 0.. run return run execute positioned ^ ^ ^1 if predicate terf:is_block_active run function terf:entity/player/tool/electron_bomb/prime

scoreboard players remove @s terf_data_A 1

scoreboard players operation temp terf_states = @s terf_data_A 
execute if score @s terf_data_A matches 301.. run scoreboard players operation temp terf_states %= 20 terf_states
execute if score @s terf_data_A matches 201..300 run scoreboard players operation temp terf_states %= 10 terf_states
execute if score @s terf_data_A matches ..200 run scoreboard players operation temp terf_states %= 5 terf_states
execute if score @s terf_data_A matches ..100 run scoreboard players operation temp terf_states %= 3 terf_states
execute if score @s terf_data_A matches ..40 run scoreboard players set temp terf_states 0

execute if score temp terf_states matches 0 run playsound terf:alarms.beep4 master @a[distance=0..] ~ ~ ~ 1 1
execute if score temp terf_states matches 2 on passengers run data modify entity @s[type=item_display] item.components.minecraft:custom_model_data.colors set value [16777215]
execute if score temp terf_states matches 0 on passengers run data modify entity @s[type=item_display] item.components.minecraft:custom_model_data.colors set value [16711680]

execute if score @s terf_data_A matches 51.. run return run execute positioned ^ ^ ^1 unless predicate terf:is_block_active run return run function terf:entity/player/tool/electron_bomb/stop
execute if score @s terf_data_A matches 50 run playsound terf:charge_up.charge master @a[distance=0..] ~ ~ ~ 100 2

particle large_smoke ~ ~.5 ~ 0 0 0 0 1 force
particle minecraft:ominous_spawning ~ ~.5 ~ 0 0 0 10 20 force

execute if score @s terf_data_A matches 1.. run return fail

execute on passengers run kill @s
kill @s
summon creeper ~ ~ ~ {Invulnerable:1,ExplosionRadius:10,Fuse:0,ignited:1,CustomName:"a high density electron blast",CustomNameVisible:0,PersistenceRequired:1b}
execute summon item_display run function terf:entity/explosion/seismic/as
execute if dimension minecraft:overworld unless predicate terf:in_upper_map unless score eruption_timer terfmap_states matches 1.. run function terf_oldmapadditions:volcano_eruption/start