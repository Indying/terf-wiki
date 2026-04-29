function datapipes_lib:power_transfer/power_tick
execute as @e[type=minecraft:marker,tag=terf_multimeter] at @s run function terf:entity/player/tool/multimeter/marker_ticked

execute as @a at @s run function terf:entity/player/slower_everyone

#gases
execute as @e[type=bat,tag=terf_gas] at @s run function terf:entity/gases/slower_tick

#"garbage collector"
execute as @e[tag=terf_currententity] at @s run function terf:found_garbage {msg:"Didnt unbind currententity tag"}

#kill all entities in storage dimension because its for blocks and load_entity_do_not_kill
execute in terf:intermediary_technical_storage_dimension run kill @e[tag=!load_entity_do_not_kill,type=!minecraft:player,distance=0..]