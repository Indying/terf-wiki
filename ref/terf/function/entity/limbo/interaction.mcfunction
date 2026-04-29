kill @e[type=minecraft:interaction,distance=..4,tag=terf_limbo]
scoreboard players set succeeded terf_states 1
execute as @s[tag=terf_key_1] as @e[type=minecraft:item_display,distance=..3,nbt={transformation:{translation:[0.6f,1.0f,0f]}}] as @s[tag=terf_correct_key] run scoreboard players set succeeded terf_states 2
execute as @s[tag=terf_key_2] as @e[type=minecraft:item_display,distance=..3,nbt={transformation:{translation:[-0.6f,1.0f,0f]}}] as @s[tag=terf_correct_key] run scoreboard players set succeeded terf_states 2
execute as @s[tag=terf_key_3] as @e[type=minecraft:item_display,distance=..3,nbt={transformation:{translation:[1.5f,0.4f,0f]}}] as @s[tag=terf_correct_key] run scoreboard players set succeeded terf_states 2
execute as @s[tag=terf_key_4] as @e[type=minecraft:item_display,distance=..3,nbt={transformation:{translation:[-1.5f,0.4f,0f]}}] as @s[tag=terf_correct_key] run scoreboard players set succeeded terf_states 2
execute as @s[tag=terf_key_5] as @e[type=minecraft:item_display,distance=..3,nbt={transformation:{translation:[1.5f,-0.4f,0f]}}] as @s[tag=terf_correct_key] run scoreboard players set succeeded terf_states 2
execute as @s[tag=terf_key_6] as @e[type=minecraft:item_display,distance=..3,nbt={transformation:{translation:[-1.5f,-0.4f,0f]}}] as @s[tag=terf_correct_key] run scoreboard players set succeeded terf_states 2
execute as @s[tag=terf_key_7] as @e[type=minecraft:item_display,distance=..3,nbt={transformation:{translation:[0.6f,-1.0f,0f]}}] as @s[tag=terf_correct_key] run scoreboard players set succeeded terf_states 2
execute as @s[tag=terf_key_8] as @e[type=minecraft:item_display,distance=..3,nbt={transformation:{translation:[-0.6f,-1.0f,0f]}}] as @s[tag=terf_correct_key] run scoreboard players set succeeded terf_states 2

