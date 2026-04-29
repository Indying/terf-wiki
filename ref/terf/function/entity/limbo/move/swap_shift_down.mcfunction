execute as @e[type=minecraft:item_display,tag=terf_limbo,distance=..1,nbt={item:{count:1},transformation:{translation:[-0.5f,1.5f,0f]}}] run data merge entity @s {item:{count:2},interpolation_duration:4,start_interpolation:0,transformation:{translation:[-0.5f,0.51f,0f]}}
execute as @e[type=minecraft:item_display,tag=terf_limbo,distance=..1,nbt={item:{count:1},transformation:{translation:[0.5f,1.5f,0f]}}] run data merge entity @s {item:{count:2},interpolation_duration:4,start_interpolation:0,transformation:{translation:[0.5f,0.51f,0f]}}

execute as @e[type=minecraft:item_display,tag=terf_limbo,distance=..1,nbt={item:{count:1},transformation:{translation:[-0.5f,0.51f,0f]}}] run data merge entity @s {item:{count:2},interpolation_duration:4,start_interpolation:0,transformation:{translation:[-0.5f,-0.51f,0f]}}
execute as @e[type=minecraft:item_display,tag=terf_limbo,distance=..1,nbt={item:{count:1},transformation:{translation:[0.5f,0.51f,0f]}}] run data merge entity @s {item:{count:2},interpolation_duration:4,start_interpolation:0,transformation:{translation:[0.5f,-0.51f,0f]}}

execute as @e[type=minecraft:item_display,tag=terf_limbo,distance=..1,nbt={item:{count:1},transformation:{translation:[-0.5f,-0.51f,0f]}}] run data merge entity @s {item:{count:2},interpolation_duration:4,start_interpolation:0,transformation:{translation:[-0.5f,-1.5f,0f]}}
execute as @e[type=minecraft:item_display,tag=terf_limbo,distance=..1,nbt={item:{count:1},transformation:{translation:[0.5f,-0.51f,0f]}}] run data merge entity @s {item:{count:2},interpolation_duration:4,start_interpolation:0,transformation:{translation:[0.5f,-1.5f,0f]}}

execute as @e[type=minecraft:item_display,tag=terf_limbo,distance=..1,nbt={item:{count:1},transformation:{translation:[-0.5f,-1.5f,0f]}}] run data merge entity @s {item:{count:2},interpolation_duration:4,start_interpolation:0,transformation:{translation:[-0.5f,1.5f,0f]}}
execute as @e[type=minecraft:item_display,tag=terf_limbo,distance=..1,nbt={item:{count:1},transformation:{translation:[0.5f,-1.5f,0f]}}] run data merge entity @s {item:{count:2},interpolation_duration:4,start_interpolation:0,transformation:{translation:[0.5f,1.5f,0f]}}
